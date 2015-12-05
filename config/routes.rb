Rails.application.routes.draw do
  resources :songs

  get 'songs/index'

  get 'songs/upload'

  get 'songs/delete'

  resources :pins do
  member do
    put "like", to: "pins#upvote"
  end
end

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
  get "sign_out", :to => "devise/sessions#destroy"
  get 'pages/index'
  get 'pages/about'
  get 'pages/landing'
  get 'pages/favorites'
  get 'users/photos'
  get 'users/songs'

end

get "songs/upload", :as => "upload"
get "songs/delete", :as => "delete"
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
authenticated do
  root :to => 'users#photos', as: :authenticated
end

root :to => 'pages#_landing'

  get "index" => "pins#index"
  get 'users/:id' => 'users#show', as: :user

  resources :charges
  resources :subscribers


  resources :user_steps

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
