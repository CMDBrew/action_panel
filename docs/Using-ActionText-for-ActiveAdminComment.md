## Using ActionText for ActiveAdminComment
1) Install action_text. See https://edgeguides.rubyonrails.org/action_text_overview.html
2) Create an initializeer
```ruby
# config/initializer/active_admin_comment_action_text.rb
# ActionText
module ActiveAdminBootstrapActionTextConcern

  extend ActiveSupport::Concern

  included do
    has_rich_text :body
  end

end

Rails.configuration.to_prepare do
  ActiveAdmin::Comment.send :include, ActiveAdminBootstrapActionTextConcern
end
```

3) Create migration to drop body field
```ruby
class DropBodyForActiveAdminComments < ActiveRecord::Migration[6.0]
  def change
    # If you need migrate existing comments you should do it first
    remove_column :active_admin_comments, :body, :text
  end
end
```

4) Change ActiveAdmin Comment Input
```ruby
ActiveAdmin.setup do |config|
  ...
  config.active_admin_comment_input = 'rich_text_area'
  ...
end
```

5) Add webpack file for ActiveAdmin
```javascript
// app/javascript/packs/active_admin.js
require("@rails/activestorage").start()
require("trix")
require("@rails/actiontext")
```

If you are using Amazon S3 make sure to add the followings to CORS configurations. For more information see https://github.com/rails/rails/issues/30723.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <MaxAgeSeconds>3000</MaxAgeSeconds>
    <AllowedHeader>Authorization</AllowedHeader>
  </CORSRule>
  <CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>PUT</AllowedMethod>
    <AllowedHeader>*</AllowedHeader>
  </CORSRule>
</CORSConfiguration>
```