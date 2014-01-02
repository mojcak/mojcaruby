RUBY::Application.routes.draw do
  #get "first/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :albuminfo
  # You can have the root of your site routed with "root"
  root 'first#index'
  
  match '/about', to: 'first#about', via: 'get'
  match '/faq', to: 'first#faq', via: 'get'
  match '/info', to: 'first#info', via: 'get'

  match '/contact', to: 'first#contact', via: 'post'
  match '/contact', to: 'first#contact', via: 'get'
  match '/index', to: 'first#index', via: 'get'
  match '/CD', to: 'first#CD', via: 'get'
  match '/LP', to: 'first#LP', via: 'get'
  match '/all', to: 'first#all', via: 'get'
  match '/orders', to: 'first#orders', via: 'get'
  match '/cart', to: 'first#cart', via: 'get'
  match '/users', to: 'users#users', via: 'get'
  match '/logout', to: 'logout#logout', via: 'get'
  match '/search', to: 'first#search', via: 'get'
  match '/show', to: 'show#show', via: 'get'
  match '/addtocart', to: 'show#addtocart', via: 'post'
  match '/removeitem', to: 'show#removeitem', via: 'post'
  match '/removeall', to: 'show#removeall', via: 'post'
  match '/checkout', to: 'checkout#checkout', via: 'post'
  match '/checkout', to: 'checkout#checkout', via: 'get'

  match '/addproduct', to: 'first#addproduct', via: 'get'
  match '/additem', to: 'additem#additem', via: 'get'
  match '/additem', to: 'additem#upload', via: 'post'

  
  match '/userinfo', to: 'first#userinfo', via: 'post'
  match '/checkout2', to: 'checkout#checkout2', via: 'post'
  match '/upload', to: 'additem#addsong', via: 'post'
  match '/upload', to: 'additem#addsong', via: 'get'

  match '/addsong', to: 'additem#addsong', via: 'post'
  match '/addsong', to: 'additem#addsong', via: 'get'


  match '/aboutuser', to: 'first#aboutuser', via: 'get'
  match '/noaddsong', to: 'additem#noaddsong', via: 'post'
  resources :users do
    collection do
      post :signin
      post :signup
    end
  end
  
  # match 'get/:id' => 'get#show', via 'get'
  #  resources :kontakt, :only => [:show]

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
