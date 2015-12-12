class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
  end

  def new

  end

  def create
    @friendship = Friendship.find(params[:message][:friendship_id])

    @message = Message.new(content: params[:message][:content], friendship_id: @friendship.id, sender_id: current_user.id, recipient_id: @friendship.friend_id)
    if @message.save
      redirect_to friendship_path(@friendship.id)
    else


    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :friendship_id, :sender_id, :recipient_id)
  end
end
