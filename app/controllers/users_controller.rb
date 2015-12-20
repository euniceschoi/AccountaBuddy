class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

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
      @badge1 = Badge.create(name: "Fitness", description: "You're a fitness superstar!", user_id: @user.id, badge_image_link: "fitness-badge.png")
      @badge2 = Badge.create(name: "Diet", description: "You're a Diet superstar!", user_id: @user.id, badge_image_link:"diet-badge.png")
      @badge3 = Badge.create(name: "Hobbies", description: "You're a Hobbies superstar!", user_id: @user.id, badge_image_link:"hobbies-badge.png")
      @badge4 = Badge.create(name: "Education", description: "You're a Education superstar!", user_id: @user.id, badge_image_link:"education-badge.png")

      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Signup was unsuccessful. Please try again."
      redirect_to '/signup'
    end
  end

  def show
    @accountabuddies = @user.friendships.where(accountabuddy:true)
    @just_friends= @user.friendships.where(accountabuddy:false)
    @friend_requests = FriendRequest.where(recipient_id: @user.id, friends: false)
    @pending_requests = FriendRequest.where(user_id: @user.id, friends:false)
    @badges = @user.badges
    @accountabuddy_requests = AccountabuddyRequest.where(recipient_id: @user.id)
    @recommendations = Recommendation.where(recipient_id: @user.id)
    @user_categories = UserCategory.where(user_id: @user.id)


    if @user.id != current_user.id
      if Friendship.find_by(user_id: current_user.id , friend_id: @user.id)
        @friendship = Friendship.find_by(user_id: current_user.id , friend_id: @user.id)
        @accountabuddy_relationship = @friendship.accountabuddy
        @inverse_friendship = Friendship.find_by(friend_id: current_user.id, user_id: @user.id)
        @inverse_accountabuddy_relationship = @inverse_friendship.accountabuddy
      else
      end
    end
  end

  def edit
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

  def delete
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

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

end
