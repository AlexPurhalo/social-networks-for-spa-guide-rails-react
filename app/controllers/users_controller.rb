class UsersController < ApplicationController
	before_action :update_permission, only: [:update]

	def receive_token
		auth = AuthenticationService.new(params[:username], params[:password])

		auth.confirmed? ?
			(render json: { confirmation_token: auth.confirmation_token }) :
			(render json: auth.errors, status: :unprocessable_entity)
	end

	def update;
		render json: { msg: 'hello' }
	end

	private
	def update_permission
		confirmation = AccountConfirmationService.new(params[:id], request.headers['X-Access-Token'])
		(render json: confirmation.errors, status: :forbidden) unless confirmation.user_confirmed?
	end

	def user_params
		params.require(:user).permit(:username)
	end
end
