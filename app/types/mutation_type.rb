MutationType = GraphQL::ObjectType.define do
	name 'Mutation'
	description 'Basic query to mutate data'

	field :createUser, UserType do
		description 'Creates a user'
		argument :id, !types.Int
		argument :username, !types.String

		resolve -> (o, args, c) {
			User.update(args[:id], username: args[:username])
		}
	end
end
