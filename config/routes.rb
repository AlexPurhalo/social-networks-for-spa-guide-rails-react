Rails.application.routes.draw do
  put '/users/:id', to: 'users#update'
	post '/users', to: 'users#create'
	post '/receive_user_token', to: 'users#receive_token'

	get '/auth/instagram/callback', to: 'users#inst_auth'

  get '/test_route', to: 'application#test_action', as: :test_route
end
