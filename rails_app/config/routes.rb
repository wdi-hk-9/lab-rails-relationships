Rails.application.routes.draw do

  resources :courses do
    resources :recipes
  end

end

