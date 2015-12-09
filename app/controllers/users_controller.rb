class UsersController < ApplicationController

  before_action :restrict_admin
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :skip_password_fields, only: [:update]

  def index
    @users = current_user.sub_users
  end

  def new
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    @user.creator = current_user

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Created user successfully' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully deleted' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :active, :locked, :role)
  end

  def set_user
    @user = User.find_by_id(params[:id])
    data = current_user.validate(@user)
    redirect_to data[:url], alert: data[:message] if data.present?
  end

  def skip_password_fields
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

  def restrict_admin
    redirect_to root_url, alert: 'You are not Authorized to do this action.' if current_user.admin?
  end

end
