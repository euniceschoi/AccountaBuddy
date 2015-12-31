class BadgesController < ApplicationController

  def edit
  end

  def update
      badge = Badge.find(params[:id])
      badge.update(points: badge.points.to_i + 1 )
      badge.save
      redirect_to user_path(badge.user.id)
  end

end
