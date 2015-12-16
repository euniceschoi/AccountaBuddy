class SessionsController < ApplicationController
  # def create
  #   # auth = request.env["omniauth.auth"]
  #   # user = User.where(:provider => auth['provider'],
  #   #                   :uid => auth['uid']).first || User.create_with_omniauth(auth)
  #   # session[:user_id] = user.id
  #   # redirect_to root_url, :notice => "Signed in!"


  # end

  def create
    if request.env['omniauth.auth']
      puts request.env['omniauth.auth'].to_yaml
      @user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        flash[:error] = "Username or Password was incorrect. Try Again."
        redirect_to root_path
      end
    end
  end
  def new
  end

  # def create
  #   p params
  #   # user = User.find_by_email(params[:email])
  #   # # If the user exists AND the password entered is correct.
  #   # if user && user.authenticate(params[:password])
  #   #   # Save the user id inside the browser cookie. This is how we keep the user
  #   #   # logged in when they navigate around our website.
  #   #   session[:user_id] = user.id
  #   #   redirect_to user_path(user.id)
  #   # else
  #   # # If user's login doesn't work, send them back to the login form.
  #   #   flash[:error] = "Incorrect password or email. Try again."
  #   #   redirect_to '/'
  #   # end
  # end

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
