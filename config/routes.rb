# DEV davinci-API
Rails.application.routes.draw do
  get 'status', to: 'application#statusx'
  
  namespace :api, defaults: { format: :json } do

  resources :circuits
  resources :kinddevs
  resources :kindbtns
  resources :compartimentos
  resources :patrimonios
  resources :centrals
  
  # root to: 'application#index'
  end# namespace /API

end
