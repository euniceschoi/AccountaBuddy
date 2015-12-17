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
    p "*" * 50
    p params
    # @user = User.new(name: params[:user][:name], username: params[:user][:username], email: params[:user][:email], about_me: params[:user][:about_me],gender: params[:user][:gender],password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], latitude: params[:latitude], longitude: params[:longitude])
    @user = User.new(user_params) 
    if @user.save
      @badge1 = Badge.new(name: "Fitness", description: "You're a fitness superstar!", user_id: @user.id, badge_image_link: "fitness-badge.png")
      @badge2 = Badge.new(name: "Diet", description: "You're a Diet superstar!", user_id: @user.id, badge_image_link:"diet-badge.png")
      @badge3 = Badge.new(name: "Hobbies", description: "You're a Hobbies superstar!", user_id: @user.id, badge_image_link:"hobbies-badge.png")
      @badge4 = Badge.new(name: "Education", description: "You're a Education superstar!", user_id: @user.id, badge_image_link:"education-badge.png")
        p "YOU MADE THE REQUEST XHR"
        if @badge1.save && @badge2.save && @badge3.save && @badge4.save
          p "You saved the badges"
          session[:user_id] = @user.id
          redirect_to user_path(@user.id)

        else
          p "YOU DIDN'T GET THE REQUEST XHR"
          flash[:error] = "Signup was unsuccessful. Please try again."
          redirect_to user_path(@user)
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
    @accountabuddy_requests = AccountabuddyRequest.where(recipient_id: @user.id)
    @recommendations = Recommendation.where(recipient_id: @user.id)

    if @user.id != current_user.id
      if Friendship.find_by(user_id: current_user.id , friend_id: @user.id)
        @friendship = Friendship.find_by(user_id: current_user.id , friend_id: @user.id)
        @accountabuddy_relationship = @friendship.accountabuddy
        @inverse_friendship = Friendship.find_by(friend_id: current_user.id, user_id: @user.id)
        @inverse_accountabuddy_relationship = @inverse_friendship.accountabuddy
      else
      end
    end
    # VERY IMPORTANT DONT DELETE
    # # LOGIC FOR _location_show
    # if current_user && current_user.id = @user.id
    # address = request.location
    #   @user.update(address: address)
    #   if @user.save(validate: false)
    #     respond_to do |format|
    #       format.html
    #       format.json { render json: @user }
    #     end
    #   else
    #     @user.errors.full_messages
    #     respond_to do |format|
    #       format.html
    #       format.json { render json: @user.errors }
    #     end
    #   end
    # end
    # # LOGIC FOR _location_all
    # if params[:search].present?
    #   @users = User.near(params[:search], 25)
    # else
    #   @users = User.all
    # end
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @user }  # respond with the created JSON object
    # end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save 
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Update was not successful. Please try again." 
      redirect_to edit_user_path(@user.id)
    end
    # if current_user && current_user.id = @user.id
    #   longitude = params["user_location"][0].to_f
    #   latitude = params["user_location"][1].to_f
    #   @user.update_attributes(latitude: latitude, longitude: longitude)
    #   if @user.save(validate: false)
    #     respond_to do |format|
    #       format.html
    #       format.json { render json: @user }
    #     end
    #   else
    #     @user.errors.full_messages
    #     respond_to do |format|
    #       format.html
    #       format.json { render json: @user.errors }
    #     end
    #   end
    # else
    #   redirect_to root_path
    # end
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :address, :latitude, :longitude, :about_me, :gender)
  end

end
