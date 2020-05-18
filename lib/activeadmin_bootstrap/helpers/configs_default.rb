module ActiveAdminBootstrap

  # Finds Config Component Class
  module ConfigsDefault

    PERSIST_DEFAULTS = %i[
      component_class action_item_display action_item_prefix
    ].freeze

    LAYOUT_CLASS = 'layout-1-column'.freeze
    COMPONENT_CLASS = {
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
        errors: 'alert alert-danger',
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
      columns: {
        breakpoint: 'md'
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
        indexes: {
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
      }
    }.freeze
    ACTION_ITEM_DISPLAY = { new: :index, edit: :show, destroy: :show }.freeze
    ACTION_ITEM_PREFIX = { new: nil, edit: nil, destroy: nil }.freeze
    SIDEBAR_POSITION = 'right'.freeze
    FILTER_POSITION = 'sidebar'.freeze
    ACTIVE_ADMIN_COMMENT_INPUT = 'text'.freeze
    PAGINATION_EXCLUSION = [].freeze

  end

end
