Rails.application.routes.draw do
  devise_for :admins, except: [:registrations] 
  devise_for :users
  get '/map_request', to: 'maps#map', as: 'map_request'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root  'users#about'
resources :users
resources :items
resources :blogs do
	resources :comments, only: [:create,:destroy]
	resources :favorite_blogs
end
resources :admins
resources :photos do
	resources :photo_comments, only: [:create,:destroy]
	resources :favorite_photos
end

get 'quit' => 'users#quit'

end
