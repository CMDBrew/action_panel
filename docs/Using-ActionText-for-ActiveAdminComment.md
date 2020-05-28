# Using ActionText for ActiveAdminComment
## Installation
1. Install action_text. See https://edgeguides.rubyonrails.org/action_text_overview.html
1. Run `rails g activeadmin_bootstrap:action_text_comments`
1. Change ActiveAdmin Comment Input
    ```ruby
    ActiveAdmin.setup do |config|
      ...
      config.active_admin_comment_input = 'rich_text_area'
      ...
    end
    ```


## CORS
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