class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_action :check_locked_account
  before_action :is_user_active

  private

  def check_locked_account
    if current_user
      return if params[:controller] == 'home' && params[:action] == 'index'
      redirect_to root_url if current_user.locked
    end
  end

  def is_user_active
    if current_user && current_user.inactive?
      sign_out(current_user)
      redirect_to root_url
    end
  end
end
