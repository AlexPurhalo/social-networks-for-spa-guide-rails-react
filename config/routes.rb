Rails.application.routes.draw do
  put '/users/:id', to: 'users#update'

  get '/test_route', to: 'application#test_action', as: :test_route
end
