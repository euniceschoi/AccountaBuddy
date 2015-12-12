class FriendRequestsController < ApplicationController
  def create
    p params
    @friend_request = FriendRequest.new(user_id: current_user.id, recipient_id: params[:recipientid][:recipient_id])
    if @friend_request.save
      redirect_to '/'
    else
      redirect '/categories/1'
    end
  end


end
