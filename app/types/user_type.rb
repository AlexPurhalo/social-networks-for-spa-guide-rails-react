UserType = GraphQL::ObjectType.define do
	name 'User'
	description 'A user'
	field :id, types.ID
	field :username, types.String
	field :inst_avatar, types.String
end
