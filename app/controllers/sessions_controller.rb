class SessionsController < ApplicationController

  def create
    if request.env['omniauth.auth']
      puts request.env['omniauth.auth'].to_yaml
      @user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      if @user.latitude == nil
        redirect_to edit_user_path(@user.id)
      else
        redirect_to user_path(@user.id)
      end
    else
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
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

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
