class FriendRequestsController < ApplicationController
  before_action :load_category_id

  def create
    @friend_request = FriendRequest.new(user_id: current_user.id, recipient_id: params[:recipientid][:recipient_id], category_id: @category_id)

    if @friend_request.save
      redirect_to user_path(current_user.id)
    else
      redirect categories_path(@category_id)
    end
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.update(friends: true)

    if @friend_request.save
      @friendship = Friendship.create(user_id: current_user.id, friend_id: @friend_request.user_id, category_id: @category_id )
      @inverse_friendship = Friendship.create(user_id: @friend_request.user_id, friend_id: current_user.id, category_id: @category_id)
      @conversation = Conversation.create(sender_id:current_user.id, recipient_id: @friend_request.user_id )
    else
      flash[:error] = "Confirmation failed. Try again later!"
    end

    redirect_to user_path(current_user.id)
  end

  private

  def load_category_id
    @category_id = @friend_request.category_id
  end

end
