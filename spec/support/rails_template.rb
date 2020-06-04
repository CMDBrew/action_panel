# rubocop:disable Metrics/LineLength
# Rails template to build the sample app for specs
generate :model, 'user first_name:string{10}:uniq last_name:string birthday:date category:string color:string biography:text super_admin:boolean avatar:string'

# Add validation
inject_into_file 'app/models/user.rb',
                 "  has_one_attached :avatar\n  validates_presence_of :first_name, :last_name\n  just_define_datetime_picker :birthday, add_to_attr_accessor: true\n", after: "ApplicationRecord\n"

# Configure default_url_options in test environment
inject_into_file 'config/environments/test.rb',
                 "  config.action_mailer.default_url_options = { :host => 'example.com' }\n", after: "config.cache_classes = true\n"

# Add our local Active Admin to the load path
inject_into_file 'config/environment.rb',
                 "\n$LOAD_PATH.unshift('#{File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib'))}')\nrequire \"active_admin\"\n",
                 after: "require File.expand_path('../application', __FILE__)"

run 'rm Gemfile'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

generate :'active_admin:install --skip-users'
generate :'action_panel:install'

run 'rm -r test'
run 'rm -r spec'

route "root to: 'admin/dashboard#index'"

rake 'db:drop'
rake 'db:create'
rake 'db:migrate'
# rubocop:enable Metrics/LineLength
