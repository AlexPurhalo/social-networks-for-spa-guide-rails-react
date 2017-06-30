MutationType = GraphQL::ObjectType.define do
	name 'Mutation'
	description 'Basic query to mutate data'

	field :createUserManually, UserType do
		description 'Creates a user'

		argument :user, CreateUserManuallyType

		resolve -> (o, args, c) {

			User.create(
				username: args[:user]['username'],
				email: args[:user]['email'],
				hashed_password: args[:user]['hashed_password']
			)
		}
	end

	field :updateUser, UserType do
		description 'Updates user data'

		argument :user, UpdateUserType

		resolve -> (o, args, c) {
			user = User.find(args[:user]['id'])
			if args[:user]['access_token'] == user.access_token
				args[:user]['username'] && user.update_attribute(:username, args[:user]['username'])
				args[:user]['email'] && user.update_attribute(:email, args[:user]['email'])
			end
			user
		}
	end
end
