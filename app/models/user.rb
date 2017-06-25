class User < ApplicationRecord
	before_create :generate_token

	def generate_token; self.access_token ||= SecureRandom.hex; end
end
