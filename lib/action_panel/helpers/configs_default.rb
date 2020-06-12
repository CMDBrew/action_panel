module ActionPanel

  # Finds Config Component Class
  module ConfigsDefault

    PERSIST_DEFAULTS = %i[
      component_class action_item_configs
    ].freeze

    NAVIGATION_CLASS = 'top'.freeze
    COMPONENT_CLASS = {
      header: 'navbar-dark bg-dark navbar-expand-lg',
      title_bar: 'navbar-light bg-light',
      content_wrapper: {
        index: 'container',
        show: 'container',
        form: 'container'
      },
      action_item: {
        group: 'btn-group',
        item: 'btn btn-secondary'
      },
      float_action: {
        group: 'fabs',
        item: 'btn-fab'
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
          tabs: 'nav-pills nav-sm'
        }
      },
      sidebar_section: {
        wrapper: 'card',
        header: 'card-header',
        body: 'card-body'
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
        submit: 'btn btn-primary',
        item: nil
      }
    }.freeze

    ACTION_ITEM_CONFIGS = {
      new: {
        display: :index,
        prefix: nil,
        class: 'btn btn-primary'
      },
      edit: {
        display: :show,
        prefix: nil,
        class: nil
      },
      destroy: {
        display: :show,
        prefix: nil,
        class: nil
      }
    }.freeze
    # ACTION_ITEM_DISPLAY = { new: :index, edit: :show, destroy: :show }.freeze
    # ACTION_ITEM_PREFIX = { new: nil, edit: nil, destroy: nil }.freeze
    SIDEBAR_POSITION = 'right'.freeze
    FILTER_POSITION = 'sidebar'.freeze
    ACTIVE_ADMIN_COMMENT_INPUT = 'text'.freeze
    PAGINATION_EXCLUSION = [].freeze

  end

end
