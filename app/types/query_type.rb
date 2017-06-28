QueryType = GraphQL::ObjectType.define do
	name 'Query'
	description 'The root query for schema'

	field :user do
		type UserType
		argument :id, !types.ID
		resolve -> (obj, args, ctx) {
			User.find(args[:id])
		}
	end
end
