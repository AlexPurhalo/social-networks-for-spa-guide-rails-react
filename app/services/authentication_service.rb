class AuthenticationService
	def initialize(username, provided_password)
		@username = username
		@provided_password = provided_password
		@errors = []
	end

	attr_reader :username, :provided_password
	attr_accessor :errors

	def confirmed?
		errors.push('Username is required') unless username
		errors.push('User with this username is not exist') if username && provided_password && !user_exist?
		errors.push('Password is required') unless provided_password
		errors.push('Passwords not matches') if username && provided_password && user_exist? && !password_matches?
		errors.empty?
	end

	def user_exist?; user; end

	def user; User.where(username: username).first; end

	def password_matches?; BCrypt::Password.new(user.hashed_password) == provided_password; end

	def confirmation_token; "#{user.id}:#{user.access_token}"; end
end
