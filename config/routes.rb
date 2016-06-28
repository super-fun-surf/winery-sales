Rails.application.routes.draw do
  resources :winery_users
  resources :sales_summaries
  get 'sales_summary/show_by_date' => 'sales_summaries#show_by_date'
  resources :tasting_rooms
  resources :wineries
  resources :regions
  resources :counties
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'sessions#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'signup' => 'users#new'
  resources :users

  get '/users/:name' => 'users#id', constraints: {
  name:       /\d{4}/

  }
  get 'send_new_activation_email' => 'users#send_new_activation_email'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
