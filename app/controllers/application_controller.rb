class ApplicationController < ActionController::API
	def query
		query_string = params[:query]
		query_variables = JSON.load(params[:variables]) || {}

		result = Schema.execute(query_string, variables: query_variables)
		render json: result
	end
end
