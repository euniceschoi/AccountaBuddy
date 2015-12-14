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
    # @badge1 = Badge.new(name: "Fitness", description: "You're a fitness superstar!", user_id: @user.id)
    # @badge2 = Badge.new(name: "Diet", description: "You're a Diet superstar!", user_id: @user.id)
    # @badge3 = Badge.new(name: "Hobbies", description: "You're a Hobbies superstar!", user_id: @user.id)
    # @badge4 = Badge.new(name: "Education", description: "You're a Education superstar!", user_id: @user.id)
    if @user.save
      @badge1 = Badge.new(name: "Fitness", description: "You're a fitness superstar!", user_id: @user.id, badge_image_link: "fitness-badge.png")
      @badge2 = Badge.new(name: "Diet", description: "You're a Diet superstar!", user_id: @user.id, badge_image_link:"diet-badge.png")
      @badge3 = Badge.new(name: "Hobbies", description: "You're a Hobbies superstar!", user_id: @user.id, badge_image_link:"hobbies-badge.png")
      @badge4 = Badge.new(name: "Education", description: "You're a Education superstar!", user_id: @user.id, badge_image_link:"education-badge.png")
        if @badge1.save && @badge2.save && @badge3.save && @badge4.save
          session[:user_id] = @user.id
          redirect_to user_path(@user.id)
        else
          flash[:error] = "Signup was unsuccessful. Please try again."
          redirect_to '/signup'
        end
    else
      flash[:error] = "Signup was unsuccessful. Please try again."
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
    @accountabuddies = @user.friendships.where(accountabuddy:true)
    @just_friends= @user.friendships.where(accountabuddy:false)
    @friend_requests = FriendRequest.where(recipient_id: @user.id, friends: false)
    @pending_requests = FriendRequest.where(user_id: @user.id, friends:false)
    @badges = @user.badges
    @friendship = Friendship.find_by(user_id: current_user.id , friend_id: @user.id)
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
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :address, :latitude, :longitude, :about_me, :birthdate, :gender)
  end

end
