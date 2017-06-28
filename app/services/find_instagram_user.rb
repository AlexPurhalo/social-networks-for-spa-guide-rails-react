class FindInstagramUser
	def initialize(session_code)
		@session_code = session_code
		@request, @user_data, @error_msg = nil
	end

	attr_reader :session_code, :request
	attr_accessor :user_data, :error_msg

	# TODO: change error message
	def setup_user_data
		request_to_api['code'].nil? ? (@user_data = {
			inst_token:    request['access_token'],
			inst_uid:      request['user']['id'],
			inst_username: request['user']['username'],
			inst_avatar:   request['user']['profile_picture']
		}) : (@error_msg = 'Something wrong with Instagram authentication')
	end

	def has_correct_data?; !user_data.nil?; end

	def exist?; User.where(inst_uid: user_data[:inst_uid]).first; end

	def create
		User.create(
			username:    user_data[:inst_username],
			inst_uid:    user_data[:inst_uid],
			inst_avatar: user_data[:inst_avatar]
		)
	end

	def data; User.where(inst_uid: user_data[:inst_uid]).first; end

	def inst_token; user_data[:inst_token]; end

	def request_to_api
		begin
			request_to_api = RestClient.post('https://api.instagram.com/oauth/access_token', {
				:client_id     => ENV['RAILS_APP_INST_CLIENT_ID'],
				:client_secret => ENV['RAILS_APP_INST_CLIENT_SECRET'],
				:redirect_uri  => ENV['RAILS_APP_INST_REDIRECT_URI'],
				:code          => session_code,
				:grant_type    => 'authorization_code'
			},  :accept        => :json)

			@request = JSON.parse(request_to_api)
		rescue => e
			@request = JSON.parse(e.response)
		end
	end
end
