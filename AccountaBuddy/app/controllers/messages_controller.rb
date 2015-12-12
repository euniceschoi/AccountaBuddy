class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
  end

  def new

  end

  def create
    @message = Message.new(message_params)
    if @message.save
      # redirect_to friendship_path(:friendship_id)
    else


    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :friendship_id, :sender_id, :recipient_id)
  end
end
