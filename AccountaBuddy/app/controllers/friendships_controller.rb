class FriendshipsController < ApplicationController

	 def index
    @friendships = Friendship.all
  end

  def new
  end

  def create
    @friendship = Friendship.new(user_params)
    if @friendship.save
      redirect_to user_path(friendship.id)
    else
      #redirect the user to their own profile page if this fails?
    end
  end

  def show
    @friendship = Friendship.find(params[:id])
    @messages = @friendship.messages

  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
  		#something here to change accountabuddy status
  end

  def delete
  	#how a user will unfriend someone
  end


end
