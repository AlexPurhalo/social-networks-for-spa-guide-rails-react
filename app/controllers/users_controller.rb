class UsersController < ApplicationController
	before_action :update_permission, only: [:update]

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
