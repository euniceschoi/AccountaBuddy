class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
    if current_user && current_user.id = @user.id
      @user
    else
      #put an error message here
      redirect_to root_path
    end
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
