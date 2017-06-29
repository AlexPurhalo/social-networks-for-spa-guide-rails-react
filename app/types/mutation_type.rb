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
end

