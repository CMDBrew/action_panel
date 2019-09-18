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


