class RegistrationsController < Devise::RegistrationsController

  before_action :restrict_sign_up, only: [:new, :edit]

  private

  def restrict_sign_up
    redirect_to new_user_session_path, alert: 'You are not allowed to sign up'
  end

end
