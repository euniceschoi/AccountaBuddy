require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test '#create creates user' do
	  assert_routing({ method: 'post', path: '/sessions' }, { controller: "sessions", action: "create" })
	   
	  params = {
	    email: "euniceschoi93@gmail.com",
	    password: "1234567",
	  };
	  
	  assert_response :success, @response.body
	end
end
