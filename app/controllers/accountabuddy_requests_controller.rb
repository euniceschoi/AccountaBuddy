class AccountabuddyRequestsController < ApplicationController
  def create
    p "*" * 60
    p params
    @recipient_id = params[:recipient][:recipient_id].to_i
    @friendship_id = params[:recipient][:friendship_id].to_i
    @accountabuddy_request = AccountabuddyRequest.new(user_id: current_user.id, recipient_id: @recipient_id, friendship_id: @friendship_id)
    if @accountabuddy_request.save
      redirect_to friendship_path(@friendship_id)
    else
      flash[:error] = "Accountabuddy request was unsuccesful. Please try again."
      redirect_to friendship_path(@friendship_id)
    end

  end

  def update
    p params
  end
end
