class BadgesController < ApplicationController

  def edit

  end

  def update
    @badge = Badge.find(params[:id])
    @badge.update
  end

end
