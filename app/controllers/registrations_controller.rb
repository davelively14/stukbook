class RegistrationsController < Devise::RegistrationsController
  # Overrides several methods in the base devise model in order to allow the username parameter to be stored. Remember
  # to change the devise path in routes.rb.

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :current_password)
  end
end