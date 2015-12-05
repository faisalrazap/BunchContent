class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_action :locked_account

  private

  def locked_account
    return if params[:controller] == 'home' && params[:action] == 'index'
    redirect_to root_url if current_user.locked
  end
end
