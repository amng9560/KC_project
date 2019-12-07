Rails.application.routes.draw do
  resources :pet_foods
  resources :pets, only: [:destroy]
  resources :foods
  
  resources :users do
    resources :pets, only: [:index, :show, :create, :update] do
      resources :foods, only: [:index, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
