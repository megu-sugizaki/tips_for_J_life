class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  # Where to go after log in
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      # admin 
      admin_root_path
      
    else
      # user
      problems_path
    end
  end
  
  # Where to go after log out
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      # admin
      new_admin_session_path
      
    else
      # user
      root_path
    end
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name, :middle_name,])
  end
end
