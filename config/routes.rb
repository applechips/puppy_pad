Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]

  get 'tags/:tag', to: 'pet_photos#show', as: :tag

  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :pets do
    resources :vets
    resources :breeders
    resources :pet_photos
    resources :medical_records
    resources :appointments
  end

  get '/', to: 'pets#index', as: 'home'

  root to: "pets#index"
end
