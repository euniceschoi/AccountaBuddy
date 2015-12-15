class UserCategoriesController < ApplicationController

  def create
    @user_category = UserCategory.new(user_id: params[:category][:user_id], category_id: params[:category][:category_id])
    if @user_category.save
      redirect_to category_path(params[:category][:category_id])
    else
      flash[:error] = "Subscription failed. Please try again."
      redirect_to category_path(params[:category][:category_id])
    end
  end

end
