class RecommendationsController < ApplicationController

	def create
		recommendation = Recommendation.new(
			user_id: current_user.id, 
			recipient_id: recommendation_params[:recipient_id].to_i, 
			body: recommendation_params[:body]
		)

		if recommendation.save
			render "recommendations/_show_recommendations", locals: {recommendation: recommendation}, layout: false
		end
	end

	private

	def recommendation_params
		params.require(:recommendation).permit(:user_id, :recipient_id, :body)
	end
end
