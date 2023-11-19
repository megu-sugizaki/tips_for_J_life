class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Where to go after log in
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      # admin 
      admin_root_path
      
    else
      # user
      if current_user.is_active == false
        reset_session
        new_user_registration_path(deleted: true)
      else
        problems_path
      end
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
  
  private

  def switch_locale(&action)
    locale = current_user&.locale || I18n.default_locale
    # current_userのlocaleが取得できたらjaがとれる、current_user取れない場合はdefault
    I18n.with_locale(locale, &action)
  end
end
