module ActiveAdmin

  module Views

    # Overwrite Scopes - activeadmin/lib/active_admin/views/components/scopes.rb
    class Scopes < ActiveAdmin::Component

      include ActiveAdminBootstrap::ConfigsFinder

      def build(scopes, options = {})
        scopes.group_by(&:group).each do |group, group_scopes|
          klass =
            "table_tools_segmented_control nav #{component_class(:table_tools, :scopes, :tabs)} "\
              "#{group_class(group)}".strip
          ul class: klass do
            group_scopes.each do |scope|
              build_scope(scope, options) if call_method_or_exec_proc(scope.display_if_block)
            end
          end
        end
      end

      protected

      # rubocop:disable Metrics/AbcSize
      def build_scope(scope, options)
        li class: classes_for_scope(scope) do
          params = request.query_parameters.except :page, :scope, :commit, :format

          a href: url_for(scope: scope.id, params: params), class: classes_for_link(scope) do
            span scope_name(scope)
            if options[:scope_count] && scope.show_count
              span get_scope_count(scope),
                   class: "count #{component_class(:table_tools, :scopes, :count)}".strip
            end
          end
        end
      end
      # rubocop:enable Metrics/AbcSize

      def classes_for_scope(scope)
        classes = ['scope', 'nav-item', scope.id]
        classes << 'selected' if current_scope?(scope)
        classes.join(' ')
      end

      def classes_for_link(scope)
        classes = %w[nav-link]
        classes << 'active' if current_scope?(scope)
        classes.join(' ')
      end

    end

  end

end
