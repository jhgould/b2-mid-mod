Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studios', to: 'studios#index'

  post '/movies/:id/add_actor', to: 'movies#update'
  get '/movies/:id', to: 'movies#show'
end
