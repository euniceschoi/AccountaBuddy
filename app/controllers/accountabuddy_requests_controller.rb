class AccountabuddyRequestsController < ApplicationController
  def create
    @accountabuddy_request = AccountabuddyRequest.new(
      user_id: current_user.id, 
      recipient_id: request_params[:recipient_id], 
      friendship_id: request_params[:friendship_id]
    )

    if !@accountabuddy_request.save
      flash[:error] = "Accountabuddy request was unsuccesful. Please try again."
    end

    redirect_to friendship_path(request_params[:friendship_id])
  end

  def update
    @accountabuddy_request = AccountabuddyRequest.find(params[:id])
    @friendship_id = @accountabuddy_request.friendship_id
    
    @friendship = Friendship.find(@friendship_id)
    @friendship.update(accountabuddy: true)

    if @friendship.save
      redirect_to friendship_path(@friendship_id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def request_params
    params.require(:recipient).permit(:recipient_id, :friendship_id)
  end

end
