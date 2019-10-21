Rails.application.routes.draw do
  get "map" => 'maps#index'
  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root  'users#about'
resources :users
resources :items
 resources :blogs do
 resources :comments, only: [:create]
end
resources :admins
resources :photos do
resources :photo_comments, only: [:create]
end

get "users_mypage" =>'users#mypage'
get 'quit' => 'users#quit'

end
