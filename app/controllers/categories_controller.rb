class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @users_in_category = @category.users
    if params[:search].present?
      @users = @users_in_category.near(params[:search], 25)
    else
      @users = @users_in_category
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
