class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_filter :get_mapbox_token, only: [:new, :edit]

  def index
    if params[:search].present?
      @users = User.near(params[:search], 25)
    else
      @users = User.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      create_badges_for_user
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Signup was unsuccessful. Please try again."
      redirect_to '/signup'
    end
  end

  def show
    @badges = @user.badges
    @recommendations = Recommendation.where(recipient_id: @user.id)
    @user_categories = UserCategory.where(user_id: @user.id)
    
    fetch_friends
    fetch_friend_requests
    search_for_friendship
  end

  def edit
    if current_user == @user
      @user
    else
      flash[:error] = "You cannot edit a different user's account!!"
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user.update(user_params)

    if @user.save
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Update was not successful. Please try again."
      redirect_to edit_user_path(@user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :username,
      :email,
      :password,
      :password_confirmation,
      :latitude,
      :longitude,
      :about_me,
      :gender,
      :attachment
    )
  end
  
  def load_user
    @user = User.find(params[:id])
  end

  def fetch_friend_requests
    @friend_requests = FriendRequest.where(recipient_id: @user.id, friends: false)
    @pending_requests = FriendRequest.where(user_id: @user.id, friends:false)
    @accountabuddy_requests = AccountabuddyRequest.where(recipient_id: @user.id)
  end

  def fetch_friends
    @accountabuddies = @user.friendships.where(accountabuddy:true)
    @just_friends = @user.friendships.where(accountabuddy:false)
  end

  def search_for_friendship
    if @user.id != current_user.id
      if Friendship.find_by(user_id: current_user.id , friend_id: @user.id)
        @friendship = Friendship.find_by(user_id: current_user.id , friend_id: @user.id)
        @accountabuddy_relationship = @friendship.accountabuddy
        @inverse_friendship = Friendship.find_by(friend_id: current_user.id, user_id: @user.id)
        @inverse_accountabuddy_relationship = @inverse_friendship.accountabuddy
      end
    end    
  end

  def create_badges_for_user
    @badge1 = Badge.create(name: "Fitness", description: "You're a fitness superstar!", user_id: @user.id, badge_image_link: "fitness-badge.png")
    @badge2 = Badge.create(name: "Diet", description: "You're a Diet superstar!", user_id: @user.id, badge_image_link:"diet-badge.png")
    @badge3 = Badge.create(name: "Hobbies", description: "You're a Hobbies superstar!", user_id: @user.id, badge_image_link:"hobbies-badge.png")
    @badge4 = Badge.create(name: "Education", description: "You're a Education superstar!", user_id: @user.id, badge_image_link:"education-badge.png")
  end

  def get_mapbox_token
    @mapbox_token = ENV['MAPBOX_TOKEN']
  end


end
