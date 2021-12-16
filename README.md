> ## ⛔️ DEPRECATED: THIS GEM IS NO LONGER BEING MAINTAINED
> This gem is no longer being maintained. Please upgrade to [Adminterface](https://adminterface.io) or other excellent alternatives listed in the [ActiveAdmin Wiki](https://github.com/activeadmin/activeadmin/wiki) instead.

# ActionPanel
ActionPanel changed the theming for the popular gem **[ActiveAdmin](https://activeadmin.info/)** to **[Bootstrap 4](https://getbootstrap.com/)** while providing some common feature extensions to allow easy creation of beautiful applications with ActiveAdmin.

## Usage
To customize ActionPanel please see the **[Wiki](docs/Home.md)**

## Installation
### Add Gem
Add this line to your application's Gemfile:
```ruby
gem 'action_panel', git: 'https://github.com/CMDBrew/action_panel.git', tag: 'v0.1.0'
```

And then execute:
```bash
bundle install
```

### Install ActionPanel
All the options are inherit from ActiveAdmin. You can find the options here https://activeadmin.info/0-installation.html#setting-up-active-admin.
```bash
rails g action_panel:install
```

If you already installed ActiveAdmin you can skip it by adding the `--skip-activeadmin` option.
```bash
rails g action_panel:install --skip-activeadmin
```

If you want to install with raw bootstrap without the default `material` theme you can add the `--skip-theme` option.
```bash
rails g action_panel:install --skip-theme
```

## Issues
For a list of common issues please see **[Common Issues](docs/Common-Issues.md)**.

## Develpoing
Please see **[Developing](docs/Developing.md)** for details.

## License
Please see **[LICENSE](LICENCE)** for licensing details.