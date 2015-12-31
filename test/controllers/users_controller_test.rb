require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test '#index returns all users' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_equal 2, users.count
  end

  test '#create creates user' do
    user_params = {
      name: "Jenna"
      username: "jennabear"
      email: "jenna@gmail.com"
      password_digest: "1234567"
      longitude: 122.0
      latitude: 37.0
      about_me: "Hello, I am a programmer looking for a workout partner"
      gender: "female"
    }

    post :create, user: user_params

    user = JSON.parse(response.body)

    assert_equal user_params[:email], user["email"]
    assert_equal user_params[:name], user["name"]
    assert_equal user_params[:longitude], user["longitude"]
  end

  test '#update updates user' do
    user = users(:eunice)
    user_params = {
      name: "eunyce"
    }

    put :update, user: user_params, id: user.id

    user = JSON.parse(response.body)

    assert_equal user_params[:name], user['name']
  end

  test '#destroy destroys user' do
    user = users(:eunice)

    assert_difference 'User.count', -1 do
      delete :destroy, id: user.id
    end

    assert_response 204
  end
end
