class AccountConfirmationService
	def initialize(provided_id, account_data)
		@provided_id = provided_id
		@account_data = account_data; @errors = []
	end

	attr_reader :account_data, :provided_id
	attr_accessor :errors

	def user_confirmed?
		errors.push('"X-Access-Token" must be provided') unless data_provided?
		if data_provided? && !data_valid?
			errors.push('Provided data is not correct, format example: "user_id:user_access_token"')
		end
		errors.push('Confirmation has been failed') if data_provided? && data_valid? && !tokens_matches?
		errors.empty?
	end

	def data_provided?; account_data; end

	def data_valid?; account_data.split(':').length === 2 ;end

	def tokens_matches?; user.access_token == provided_token; end

	def user; User.find(provided_id); end

	def provided_token; account_data.split(':').last; end
end
