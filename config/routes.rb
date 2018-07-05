Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'forum_threads#index'
  resources :forum_threads do 
  	resources :forum_posts, module: :forum_threads
  end

  devise_scope :user do
  	get '/users/profile', to: 'devise/sessions#profile'
	end
end
