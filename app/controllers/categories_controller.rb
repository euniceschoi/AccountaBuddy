class CategoriesController < ApplicationController

  before_action :load_user_categories
  before_filter :get_mapbox_token

  def index
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  def show
    @user = User.find(params[:id])
    @category = Category.find(params[:id])
    @users_in_category = @category.users

    check_if_user_subscribed
    look_for_users_closeby

    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  private
 
  def category_params
    params.require(:category).permit(:name)
  end

  def load_user_categories
    @user_categories = UserCategory.all
  end

  def check_if_user_subscribed
    if UserCategory.exists?(user_id: current_user.id, category_id: @category.id)
      @user_category = true
    end
  end

  def look_for_users_closeby 
    if params[:search].present?
      @users_close_by = @users_in_category.near(params[:search], 25)
    else
      @users_close_by = @users_in_category
    end
  end

  def get_mapbox_token
    @mapbox_token = ENV['MAPBOX_TOKEN']
  end

end
