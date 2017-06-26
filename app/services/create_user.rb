class CreateUser
	def initialize(params); @params, @errors, @user = params, [], nil; end

	attr_reader :params, :user
	attr_accessor :errors

	def has_valid_params?
		errors.push('"username" is required') unless params[:username]
		errors.push('"username" is already taken') if params[:username] && username_taken?
		errors.push('"hashed_password" is required') unless params[:hashed_password]
		errors.empty?
	end

	def create
		@user = User.create(
			username: params[:username],
			hashed_password: params[:hashed_password]
		)
	end

	def username_taken?; User.where(username: params[:username]).first; end

	def confirmation_token; "#{user.id}:#{user.access_token}"; end
end
