class RegistrationsController < Devise::RegistrationsController

  def new
    redirect_to new_user_session_path, alert: 'You are not allowed to sign up'
  end

  def create
    redirect_to new_user_session_path, alert: 'You are not allowed to sign up'
  end

end
