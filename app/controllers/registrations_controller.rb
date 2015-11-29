class RegistrationsController < Devise::RegistrationsController

  before_action :restrict_sign_up, only: [:new, :edit]
  before_action :set_user, only: [:edit_user, :update_user, :destroy_user]
  before_action :skip_password_fields, only: [:update_user]

  def user_list
    @users = User.all
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Created user successfully' }
      else
        format.html { render :new_user }
      end
    end
  end

  def edit_user
  end

  def update_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated' }
      else
        format.html { render :edit_user }
      end
    end
  end

  def destroy_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully deleted' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :active, :locked, :role)
  end

  def restrict_sign_up
    redirect_to new_user_session_path, alert: 'You are not allowed to sign up'
  end

  def set_user
    @user = User.find_by(params[:id])
    redirect_to users_path, alert: 'User does not exist' if @user.blank?
  end

  def skip_password_fields
    if params[:user][:password].blank?
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
    end
  end

end
