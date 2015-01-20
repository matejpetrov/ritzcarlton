Rails.application.routes.draw do    

  get 'visits/create'

  get 'visits/edit'

  get 'visits/update'

  get 'visits/destroy'

  get 'visits_controller/create'

  get 'visits_controller/edit'

  get 'visits_controller/update'

  get 'visits_controller/destroy'

  get 'guests/new'

  #get 'home/about'

  #we define the named routes

  root 'statis_pages#home'

  #after a line like this, these two variables are created
  #about_path -> '/about'
  #about_url  -> 'http://www.example.com/about'
  get 'about' => 'statis_pages#about'
  get 'signup' => 'employees#new'
  get 'all_guests' => 'statis_pages#all_guests'

  #routes for the session controller. Logging in and logging out. 
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'

  get 'modal_delete/:id' => 'guests#modal_delete'

  resources :employees  
  resources :guests, only: [:create, :destroy, :edit, :update, :show]
  resources :visits, only: [ :create, :edit, :update, :show, :destroy]

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
