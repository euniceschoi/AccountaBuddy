class MessagesController < ApplicationController
  def new
  end

  def create
    body = params[:message][:body]
    conversation_id = params[:message][:conversation].to_i
    friendship_id = params[:message][:friendship].to_i

    message = Message.new(body: body, user_id: current_user.id, conversation_id: conversation_id)

    if message.save
      render "messages/_show_messages", locals: {message: message}, layout: false
    else
      flash[:error] = "Message was not sent"
      redirect_to friendship_path(friendship_id)
    end
  end
end
