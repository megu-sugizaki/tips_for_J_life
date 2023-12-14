class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to problems_path, notice: "Logged in as a guest user"
  end
end