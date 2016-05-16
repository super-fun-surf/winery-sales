Rails.application.routes.draw do
  root 'sessions#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'signup' => 'users#new'
  resources :users
  get 'send_new_activation_email' => 'users#send_new_activation_email'
  resources :account_activations, only: [:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
