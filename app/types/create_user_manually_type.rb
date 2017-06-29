CreateUserManuallyType = GraphQL::InputObjectType.define do
	name 'CreateUserType'
	description 'Properties for creating a user'

	argument :username, !types.String
	argument :email, types.String
	argument :hashed_password, !types.String do
		description 'Hashed password by client side - for new user'
	end
end
