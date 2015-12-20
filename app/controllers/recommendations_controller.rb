class RecommendationsController < ApplicationController

	def create
		@recipient_id = params[:recommendation][:recipient_id].to_i
		@recommendation_body = params[:recommendation][:body]
		recommendation = Recommendation.new(user_id: current_user.id , recipient_id: @recipient_id, body: @recommendation_body)

		if recommendation.save
			render "recommendations/_show_recommendations", locals: {recommendation: recommendation}, layout: false
		end
	end

	private

	def recommendation_params
		params.require(:recommendation).permit(:user_id, :recipient_id, :body)
	end
end
