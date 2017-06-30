UpdateUserType = GraphQL::InputObjectType.define do
	name 'UpdateUserType'
	description 'Updates info about user'

	argument :id, !types.ID
	argument :username, types.String
	argument :email, types.String
	argument :access_token, !types.String do
		description 'Token for account verification'
	end
end
