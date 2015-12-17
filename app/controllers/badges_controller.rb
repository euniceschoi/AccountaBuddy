class BadgesController < ApplicationController

  def edit

  end

  def update
      badge = Badge.find(params[:id])
      badge.update(points: badge.points.to_i + 1 )
      badge.save


      respond_to do |format|
        format.html 
        # { render :nothing => true}
        format.json{ render json: badge.points, status: 200 }
      end
      # p @badge
      # p @badge
      # redirect_to user_path(@badge.user.id)
  end

end
