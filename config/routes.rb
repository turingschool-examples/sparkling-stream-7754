Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/ingredients', to: 'ingredients#index'

  get '/recipes/:id', to: 'recipes#show'

  patch '/recipes/:recipe_id', to: 'recipes#update'
end
