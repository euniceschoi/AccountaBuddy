class FriendRequestsController < ApplicationController
  def create
    p params
    @friend_request = FriendRequest.new(user_id: current_user.id, recipient_id: params[:recipientid][:recipient_id])
    @category = params[:recipientid][:category_id].to_i
    if @friend_request.save
      redirect_to user_path(current_user.id)
    else
      redirect categories_path(@category)
    end
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.update(friends: true)
    @friendship = Friendship.new(user_id: current_user.id, friend_id: @friend_request.user_id)
    @inverse_friendship = Friendship.new(user_id: @friend_request.user_id, friend_id: current_user.id)
    Conversation.create(sender_id:current_user.id, recipient_id: @friend_request.user_id )
    @inverse_friendship.save
    if @friendship.save
      redirect_to user_path(current_user.id)
    else
      #redirect the user to their own profile page if this fails?
    end
  end


end
