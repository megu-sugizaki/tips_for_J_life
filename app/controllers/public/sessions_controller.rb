# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  # M:Indent fixed
  before_action :user_status, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
  def user_status
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    
    if @user.valid_password?(params[:user][:password])
      if @user.is_active == false
        # reset_session
        # redirect_to new_user_registration_path, alert: 'Your account has been inactivated. Contact the admin if you would like to' and return
      end  
    end
  end
end
