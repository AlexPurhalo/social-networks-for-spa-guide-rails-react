Rails.application.routes.draw do
  put '/users/:id', to: 'users#update'
	post '/users', to: 'users#create'
	post '/receive_user_token', to: 'users#receive_token'

	get '/auth/instagram/callback', to: 'users#inst_auth'

  post '/graphql', to: 'application#query', as: :graphql

	if Rails.env.development?
		mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
	end
end
