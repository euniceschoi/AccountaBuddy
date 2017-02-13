class FriendRequestsController < ApplicationController

  def create
    @friend_request = FriendRequest.new(
      user_id: current_user.id, 
      recipient_id: friend_request_params[:recipient_id], 
      category_id: friend_request_params[:category_id].to_i
    )

    if @friend_request.save
      redirect_to user_path(current_user.id)
    else
      redirect categories_path(friend_request_params[:category_id].to_i)
    end
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    @category_id = @friend_request.category_id
    @friend_request.update(friends: true)

    if @friend_request.save
      create_friendship
    else
      flash[:error] = "Confirmation failed. Try again later!"
    end

    redirect_to user_path(current_user.id)
  end

  private

  def friend_request_params
    params.require(:recipientid).permit(:category_id, :recipient_id)
  end

  def create_friendship
    @friendship = Friendship.create(
      user_id: current_user.id, 
      friend_id: @friend_request.user_id, 
      category_id: @category_id 
    )

    @inverse_friendship = Friendship.create(
      user_id: @friend_request.user_id, 
      friend_id: current_user.id, 
      category_id: @category_id
    )

    @conversation = Conversation.create(
      sender_id:current_user.id, 
      recipient_id: @friend_request.user_id 
    )    
  end

end
