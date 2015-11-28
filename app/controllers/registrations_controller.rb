class RegistrationsController < Devise::RegistrationsController

  def new
    redirect_to new_user_session_path, alert: 'You are not allowed to create new account'
  end

end
