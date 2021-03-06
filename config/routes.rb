Rails.application.routes.draw do

 if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


namespace :api, :defaults => { :format => 'json' } do
    resources :users
    resources :posts 
  end

  resources :pages
  get "/pages/about_us" => "pages#about_us"
  get "/pages/contact" => "pages#contact"
  post "/contacts/new" => "contacts#create"
  resources :contacts
  root to: "pages#root"

  resources :posts do
  resources :comments
end
  get '/posts/:id/comments/new/(:parent_id)' => "comments#new", as: :new_comment
  resources :login
  post "/login/new" => "login#create"
  get "/logout" => "login#logout"
  post "/posts" => "posts#create"

  resources :users do 
    resources :photos 
    resources :comments
end

  #get 'pages/:id', to: 'pages#root', constraints: { id: /./ }

 # post "login/new"=>"login#create"

  #get "/home" => "home#index"
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
