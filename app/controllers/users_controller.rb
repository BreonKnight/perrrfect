class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = user_params
    if @user.save
      flash[:notice] = "Succesfully created account"
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      redirect_to new_user_path
  end

  def show
    user_id = params[:id]
    @user = User.find_by_name(user_id)
    render :show
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_name(user_id)
    render :edit
  end

  def update
    user_id = params[:id]
    user = User.name(user_id)
    user_edit_params = params.require(:user).permit(:first_name, :last_name, :twitch_name, :avatar)
    # If we decide to let users update email address, email will be downcased before submission & update
    user.update_attributes(user_edit_params)
    redirect_to user_path(user)
  end

  def destroy
    user_id = params[:id]
    user = User.find_by_userName(user_id)
    user.destroy
    redirect_to root
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :name, :twitch_name, :email, :password, :avatar )
    end
end
