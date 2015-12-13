class FriendRequestsController < ApplicationController
  def create
    p params
    @category_id = params[:recipientid][:category_id].to_i
    @friend_request = FriendRequest.new(user_id: current_user.id, recipient_id: params[:recipientid][:recipient_id], category_id: @category_id)
    if @friend_request.save
      redirect_to user_path(current_user.id)
    else
      redirect categories_path(@category_id)
    end
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    @category_id = @friend_request.category_id
    @friend_request.update(friends: true)
    @friendship = Friendship.new(user_id: current_user.id, friend_id: @friend_request.user_id, category_id: @category_id )
    @inverse_friendship = Friendship.new(user_id: @friend_request.user_id, friend_id: current_user.id, category_id: @category_id)
    @conversation = Conversation.new(sender_id:current_user.id, recipient_id: @friend_request.user_id )
    # @inverse_friendship.save
    if @friendship.save && @inverse_friendship.save && @conversation.save
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Confirmation failed. Try again later!"
      redirect_to user_path(current_user.id)
    end
  end


end
