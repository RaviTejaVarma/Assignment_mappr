Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	namespace :api, defaults: { format: 'json' } do
		namespace :v1 do
    		resources :products, only: [:create]
    		put '/products/:id' => 'products#update'
    		get '/products/:id' => 'products#show'
  		end
	end
end
