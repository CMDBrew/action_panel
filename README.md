# ActionPanel
ActionPanel changed the theming for the popular gem **[ActiveAdmin](https://activeadmin.info/)** to **[Bootstrap 4](https://getbootstrap.com/)** while providing some common feature extensions to allow easy creation of beautiful applications with ActiveAdmin.

## Usage
To customize ActionPanel please see the **[Wiki](docs/Home.md)**

## Installation
### Add Gem
Add this line to your application's Gemfile:
```ruby
gem 'action_panel', git: 'https://github.com/CMDBrew/action_panel.git', branch: 'master'
```

Add API key to (/Users/username/.bundle/config)
```shell
bundle config github.com YOUR_API_KEY
```

And then execute:
```bash
bundle install
```

### Install ActiveAdmin
If you haven't already installed it
```bash
rails g active_admin:install
```

### Install ActionPanel
```bash
rails g action_panel:install
```

## Develpoing
Please see **[Developing](docs/Developing.md)** for details.

## License
Please see **[LICENSE](LICENCE)** for licensing details.