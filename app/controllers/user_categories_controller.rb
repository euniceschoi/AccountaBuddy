class UserCategoriesController < ApplicationController

  def create
    @user_category = UserCategory.new(
    	user_id: user_category_params[:user_id], 
    	category_id: user_category_params[:category_id]
  	)

    if @user_category.save
      redirect_to category_path(user_category_params[:category_id])
    else
      flash[:error] = "Subscription failed. Please try again."
      redirect_to category_path(user_category_params[:category_id])
    end
  end

	private

	def user_category_params
		params.require(:category).permit(:user_id, :category_id)
	end

end
