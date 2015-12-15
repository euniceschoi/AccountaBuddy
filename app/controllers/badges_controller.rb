class BadgesController < ApplicationController

  def edit

  end

  def update
    @badge = Badge.find(params[:id])
    p @badge
    @badge.update(points: @badge.points.to_i + 1 )
    p @badge
    @badge.save
    redirect_to user_path(@badge.user.id)
  end

end
