class RegistrationsController < Devise::RegistrationsController
#   Extending the base devise model in order to allow the username parameter to be stored. Also added to routes.rb.

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :current_password)
  end
end