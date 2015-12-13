class UsersController < ApplicationController

  def index
    if params[:search].present?
      @users = User.near(params[:search], 25)
    else
      @users = User.all
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
    @accountabuddies = @user.friendships.where(accountabuddy:true)
    @just_friends= @user.friendships.where(accountabuddy:false)
    @friend_requests = FriendRequest.where(recipient_id: @user.id, friends: false)
    @pending_requests = FriendRequest.where(user_id: @user.id, friends:false)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user && current_user.id = @user.id
      @user
    else
      #put an error message here
      redirect_to root_path
    end
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :address, :latitude, :longitude)
  end

end
