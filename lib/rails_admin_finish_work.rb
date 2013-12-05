require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
 
module RailsAdminFinishWork
end
 
module RailsAdmin
  module Config
    module Actions
      class FinishWork < RailsAdmin::Config::Actions::Base
    
        register_instance_option :visible? do
          bindings[:abstract_model].model.to_s == "Work" && bindings[:object].in_progress?
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :controller do
          Proc.new do
            @object.finish
            flash[:notice] = "You have marked Work ##{@object.id} as finished."
 
            redirect_to back_or_index
          end
        end

        register_instance_option :link_icon do
          'icon-check'
        end

      end
    end
  end
end
