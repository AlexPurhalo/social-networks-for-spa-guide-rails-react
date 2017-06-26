class UsersController < ApplicationController
	before_action :update_permission, only: [:update]

	def create
		user = CreateUser.new(params)
		user.has_valid_params? ?
			(user.create &&
				(render json: { confirmation_token: user.confirmation_token })
			) :
			(render json: user.errors, status: :unprocessable_entity)
	end

	def receive_token
		auth = AuthenticationService.new(params[:username], params[:password])

		auth.confirmed? ?
			(render json: { confirmation_token: auth.confirmation_token }) :
			(render json: auth.errors, status: :unprocessable_entity)
	end

	# TODO: provide logic for user updating
	def update;
		render json: { msg: 'hello' }
	end

	private
	def update_permission
		confirmation = AccountConfirmationService.new(params[:id], request.headers['X-Access-Token'])
		(render json: confirmation.errors, status: :forbidden) unless confirmation.user_confirmed?
	end

	def user_params
		params.permit(:username, :hashed_password)
		# params.permit(:username, :hashed_password)
	end
end
