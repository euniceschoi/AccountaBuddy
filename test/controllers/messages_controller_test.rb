require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test '#create creates message' do
    message_params = {
      body: "Hello",
      conversation_id: 1,
      user_id: 1
    }

    post :create, message: message_params

    message = JSON.parse(response.body)

    assert_equal message_params[:body], message["body"]
  end
end
