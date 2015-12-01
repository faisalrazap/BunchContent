class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :skip_password_fields, only: [:update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)

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
    redirect_to users_path, alert: 'User does not exist' if @user.blank?
  end

  def skip_password_fields
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end


end
