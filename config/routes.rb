Rails.application.routes.draw do
  get 'users/new'
  get '/messages' => 'messages#index' 
  post '/users' => 'users#login'
  post '/message' => 'messages#message' 
  post '/comment' => 'comments#comment'
  get '/logout' => 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
