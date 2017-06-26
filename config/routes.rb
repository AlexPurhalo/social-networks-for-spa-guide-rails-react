Rails.application.routes.draw do
  put '/users/:id', to: 'users#update'
	post '/receive_user_token', to: 'users#receive_token'

  get '/test_route', to: 'application#test_action', as: :test_route
end
