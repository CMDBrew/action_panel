require 'active_admin/dynamic_settings_node'

module ActiveAdmin

  # Overwrite NamespaceSettings - lib/active_admin/namespace_settings.rb
  class NamespaceSettings < DynamicSettingsNode

    # The default site_title content
    register :site_title_proc, nil

    # The default component_class
    register(:component_class,
             header: 'navbar-dark bg-dark navbar-expand-lg',
             title_bar: 'navbar-light bg-light',
             action_item: {
               group: 'btn-group',
               item: 'btn btn-secondary'
             },
             flash: {
               default: 'alert',
               alert: 'alert-warning',
               notice: 'alert-info'
             },
             blank_slate: 'alert alert-secondary text-center',
             tabs: 'nav-tabs',
             table_for: 'table',
             attributes_table: {
               wrapper: 'table-responsive',
               table: 'table text-break'
             },
             filters: {
               actions: {
                 submit: 'btn btn-primary',
                 cancel: 'btn btn-link'
               }
             },
             form: {
               has_many: {
                 item: 'border mb-3',
                 new: 'btn btn-sm btn-light',
                 destroy: 'text-danger'
               },
               actions: {
                 submit: 'btn btn-primary',
                 cancel: 'btn btn-link'
               }
             },
             index_as_table: {
               wrapper: 'table-responsive',
               table: 'table table-sm',
               btn: {
                 group: 'btn-group',
                 item: 'btn btn-sm btn-light'
               }
             },
             table_tools: {
               btn: 'btn btn-sm btn-light',
               scopes: {
                 tabs: 'nav-tabs',
                 count: 'badge badge-primary'
               },
               index_list: {
                 wrapper: 'btn-group',
                 item: {
                   inactive: 'btn btn-sm btn-light',
                   active: 'btn btn-sm btn-primary'
                 }
               }
             },
             panel: {
               wrapper: 'card',
               header: 'card-header',
               body: 'card-body'
             },
             active_admin_comments: {
               wrapper: 'card',
               header: 'card-header',
               body: 'card-body',
               submit: 'btn btn-primary'
             })

    # The default action_item display actions
    register(:action_item_display,
             new: 'index', edit: 'show', destroy: 'show')

    # The default action_item prefix
    register(:action_item_prefix,
             new: nil, edit: nil, destroy: nil)

    # The default sidebar position
    register :sidebar_position, 'right'

    # The default filter_position
    register :filter_position, 'sidebar'

    # Use rich textarea for active_admin_comments?
    register :active_admin_comment_input, 'text'

    # Pagination Exclusion
    register :pagination_exclusion, []

  end

end
