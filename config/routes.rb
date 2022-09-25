Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do

  resources :circuits
  resources :kinddevs
  resources :kindbtns
  resources :compartimentos
  resources :patrimonios
 
              # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  end

end
