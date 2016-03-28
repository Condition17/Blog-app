Rails.application.routes.draw do

  get "/home", to: :index, controller: :home
  get "/pages/about_us" => "pages#about_us"
  get "/pages/contact" => "pages#contact"
  get '/contacts' => "contacts#index"
  get "/contacts/new" => "contacts#new"
  post "/contacts/new" => "contacts#create"
  get "/contacts/show" => "contacts#show"
  root to: "pages#root"
    get "/posts/new" => "posts#new"

  get "/posts" => "posts#index"
  get '/posts/:id' => "posts#show",as: :post
  patch 'posts/:id' => "posts#update"
 get "/posts/:id/edit" => "posts#edit",as: :edit_post
 delete "/posts/:id" => "posts#destroy",as: :delete_post

  get "/login/new"=>"login#new"
 post "/login/new" => "login#create"
  get "/login/logout" => "login#logout"
  post "/posts" => "posts#create"
  
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/users" => "posts#index"
 


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
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
