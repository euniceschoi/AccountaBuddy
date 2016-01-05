require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test '#create creates message' do
    
    assert_routing({ method: 'post', path: '/messages' }, { controller: "messages", action: "create" })
    message_params = {
      body: "Hello",
      conversation_id: 2,
      user_id: 1
    }

    assert_difference('Message.count') do
      post :create, message: message_params
    end

    
    # assert_equal message_params[:body], message["body"]
  end
end
