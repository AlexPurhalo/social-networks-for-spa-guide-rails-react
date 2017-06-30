class ApplicationController < ActionController::API
	def query
		result = Schema.execute(
			params[:query],
			variables: params[:variables]
		)
		render json: result
	end
end
