class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

  def set_search
    @q =  Item.ransack(params[:q])
    #@q =  Item.search(params[:q])
  end

  	def after_sign_in_path_for(resource)
		case resource
		when User
        users_path
		when Admin
        admins_path
		end
	end

  protected
    def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end


end
