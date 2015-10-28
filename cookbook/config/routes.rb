Rails.application.routes.draw do
  # get 'recipes/index', to: 'recipes#index'

  # get 'recipes/show', to: 'recipes#show'

  resources :courses do
    resources :recipes
  end

end