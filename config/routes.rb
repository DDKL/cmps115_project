Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations", sessions: "sessions"}
  
  get 'urls/new'
  get 'urls/create'
  
  get 'users/:id' => 'users#show'

  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/advertising'
  get 'static_pages/help'
  
  resources :urls
  
  #resources :user
  
  #root to:'static_pages#about'

  devise_scope :user do
	authenticated :user do
		root :to => 'users#show', as: :authenticated_root
	end
	unauthenticated :user do
		root :to => 'registrations#new', as: :unauthenticated_root
	end
  end


  get 'testing/crawler' => 'crawler#crawler_test'
  get 'testing/grid/:id' => 'grid#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'


  #commented out for now
  #root 'crawler#crawler_test'


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
