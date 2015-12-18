class BadgesController < ApplicationController

  def edit

  end

  def update
      p params
      badge = Badge.find(params[:id])
      badge.update(points: badge.points.to_i + 1 )
      badge.save
      redirect_to user_path(badge.user.id)


      # respond_to do |format|
      #   format.html 
        
      #   format.json{ render json: badge.points, status: 200 }
      # p @badge
      # p @badge
      # redirect_to user_path(@badge.user.id)
  end

end
