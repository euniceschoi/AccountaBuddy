require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test '#index returns all users' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test '#create creates user' do


    assert_routing({ method: 'post', path: '/users' }, { controller: "users", action: "create" })
   
    user_params = {
      name: "Jenna",
        username: "jennabear",
        email: "jenna@gmail.com",
        password: "1234567",
        longitude: 122.0,
        latitude: 37.0,
        about_me: "Hello, I am a programmer looking for a workout partner",
        gender: "female"

    }
    assert_difference('User.count') do
      post :create, user: user_params
    end
     
    assert_redirected_to user_path(assigns(:user))


  end

  test '#update updates user' do
    user = users(:eunice)
    user_params = {
      name: "eunyce"
    }

    patch :update, id: user.id, user: user_params
    
    assert_equal user_params[:name], assigns(:user).name
  end

  test '#destroy destroys user' do
    user = users(:eunice)

    assert_difference('User.count',-1) do
      delete :destroy, id: user.id
    end

    assert_redirected_to root_path
  end
end
