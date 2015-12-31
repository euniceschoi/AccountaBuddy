class FriendshipsController < ApplicationController

	def index
    @friendships = Friendship.all
  end

  def new
  end

  def create
    @friendship = Friendship.new(user_params)
    if @friendship.save
      redirect_to user_path(friendship.id)
    else
    end
  end

  def show
    @friendship = Friendship.find(params[:id])

    @conversation = Conversation.find_by(sender_id: @friendship.user_id, recipient_id: @friendship.friend_id ) || Conversation.find_by(recipient_id: @friendship.user_id, sender_id: @friendship.friend_id)
    @friend = User.find(@friendship.friend_id)
    @user = User.find(@friendship.user_id)
    if @conversation && @conversation.messages
      @messages = @conversation.messages.order("created_at DESC")
    else
    end
  end

  def edit
  end

  def update
      @friendship = Friendship.find(params[:id])
      @friend_id = @friendship.user_id
      @inverse_friendship = Friendship.find(friend_id: @friend_id)
      @inverse_friendship.update(accountabuddy: true)
  		@friendship.update(accountabuddy: true)

      if @friendship.save && @inverse_friendship.save
        redirect_to user_path(current_user.id)
      else
        redirect_to friendship_path(friendship.id)
      end
  end

  def delete
  	#how a user will unfriend someone
  end


end
