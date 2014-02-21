SnowFlow::Application.routes.draw do

  resources :orders

  #routing for static pages
  root to: 'static#home'
  get '/contacts' => 'static#contacts'
  get '/about' =>  'static#about'


  #signing routing
  get '/signin' => 'session#new'
  delete '/signout' => 'session#destroy'
  get '/signup' => 'user#new'

  resources :session, only: :create


  #user routing
  resources :user, only: [:create,:destroy,:update,:edit,:index, :show]

  #items routing
  resources :item, only: [:new, :update, :create, :destroy, :edit, :show ]
  get "/catalogue" => 'item#index'
  post '/catalogue' => 'item#index'


  #cart routing
  get '/checkout' => 'carts#checkout'
  get '/add_to_cart' => 'carts#add_to_cart'
  get '/remove_position' => 'carts#remove_position'

  resources :carts, only: [:edit, :update]





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
