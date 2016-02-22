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

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
