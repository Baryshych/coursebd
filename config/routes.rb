Rails.application.routes.draw do
  devise_for :users
  resources :students do  
    resource :marks  
  end
    resources :subjects
    resources :lecturers
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
  match "/login" => "sessions#create", :as => :login, via: [:post]
  match "/login" => "sessions#new",  via: [:get]
  match "/mainbase" => "mainbase#view", via: [:get]
  match "/students/new" => "students#create", via: [:post]
  match "/subjects/new" => "subjects#create", via: [:post]
  match "/lecturers/new" => "lecturers#create", via: [:post]
  post "/students/:id" => "students#edit"
  post "/students/:id/edit" => "students#edit"
  match "/students/:id/set_marks" => "students#set_marks", via: [:get]
  match "/students/:id/set_marks" => "students#save_marks", via: [:post]
  match "/options" => "mainbase#options", via: [:get]
  root "sessions#new"
end
