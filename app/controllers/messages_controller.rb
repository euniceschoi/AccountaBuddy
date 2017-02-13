class MessagesController < ApplicationController
  def new
  end

  def create
    message = Message.new(
      body: message_params[:body], 
      user_id: current_user.id, 
      conversation_id: message_params[:conversation].to_i)

    if message.save
      render "messages/_show_messages", locals: {message: message}, layout: false
    else
      flash[:error] = "Message was not sent"
      redirect_to friendship_path(message_params[:friendship].to_i)
    end
  end

  private 

  def message_params
    params.require(:message).permit(:body, :conversation, :friendship)
  end
end
