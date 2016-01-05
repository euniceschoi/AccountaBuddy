require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without a name" do 
  	user = User.new(
        username: "jennabear",
        email: "jenna@gmail.com",
        password: "1234567",
        longitude: 122.0,
        latitude: 37.0,
        about_me: "Hello, I am a programmer looking for a workout partner",
        gender: "female")
  	assert_not user.save, "Saved user without a name"
  end

   test "should not save user without a username" do 
  	user = User.new(
  		name: "jenna",
        email: "jenna@gmail.com",
        password: "1234567",
        longitude: 122.0,
        latitude: 37.0,
        about_me: "Hello, I am a programmer looking for a workout partner",
        gender: "female")
  	assert_not user.save, "Saved user without a username"
  end

   test "should not save user without a password" do 
  	user = User.new(
  		name: "jenna",
  		username: "jennabear",
        email: "jenna@gmail.com",
        longitude: 122.0,
        latitude: 37.0,
        about_me: "Hello, I am a programmer looking for a workout partner",
        gender: "female")
  	assert_not user.save, "Saved user without a password"
  end
end
