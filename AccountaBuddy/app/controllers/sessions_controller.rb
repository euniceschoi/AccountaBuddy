class SessionsController < ApplicationController
  # def create
  #   # auth = request.env["omniauth.auth"]
  #   # user = User.where(:provider => auth['provider'],
  #   #                   :uid => auth['uid']).first || User.create_with_omniauth(auth)
  #   # session[:user_id] = user.id
  #   # redirect_to root_url, :notice => "Signed in!"


  # end

  # def create
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_path
  # end
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  # def new
  #   redirect_to '/auth/facebook'
  # end

  # def destroy
  #   reset_session
  #   redirect_to root_url, notice => 'Signed out'
  # end
end
