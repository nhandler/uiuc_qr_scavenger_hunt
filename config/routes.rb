Rails.application.routes.draw do

  root 'home#home'
  resources :codes
  get 'register_code' => 'codes#register_code'
  get 'register_code/:code' => 'codes#register_code'
  get 'leaders' => 'codes#leaders'
  get 'home' => 'home#home'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
