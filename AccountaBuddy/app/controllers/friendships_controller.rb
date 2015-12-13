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
      #redirect the user to their own profile page if this fails?
    end
  end

  def show
    @friendship = Friendship.find(params[:id])
    @conversation1 = Conversation.find_by(sender_id: @friendship.user_id, recipient_id: @friendship.friend_id)
    @conversation2= Conversation.find_by(recipient_id: @friendship.user_id, sender_id: @friendship.friend_id)
    p "*" * 60
    p @conversation
    @friend = User.find(@friendship.friend_id)
    if @conversation2 && @conversation2.messages
      @messages = @conversation2.messages
      # .order("created_at DESC").all
    else
     @conversation1 && @conversation1.messages
      @messages = @conversation1.messages
      # .order("created_at DESC").all
    end

  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
  		#something here to change accountabuddy status
  end

  def delete
  	#how a user will unfriend someone
  end


end
