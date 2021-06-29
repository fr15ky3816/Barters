Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: "admins/passwords",
    registrations: "admins/registrations",
  }

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post 'customers', to: 'public/registrations#create', as: :customer_registration
    get "customers/sign_in", to: "public/sessions#new", as: :new_customer_session
    post "customers/sign_in", to: "public/sessions#create", as: :customer_session
    delete "customers/sign_out", to: "public/sessions#destroy", as: :destroy_customer_session
  end

  scope module: :public do
    resources :customers do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get "offers" => "offers#offers_index"
      get "offered" => "offers#offered_index"
      get "orders/listing" => "orders#listing"
      get "orders/in_progress" => "orders#in_progress"
      get "orders/completed" => "orders#completed"
      get "product/index" => "products#index", as: :product_index
    end

    get "product/index_1" => "products#index_1", as: :product_index_1
    get "product/index_2" => "products#index_2", as: :product_index_2
    get "product/index_3" => "products#index_3", as: :product_index_3
    get "product/index_4" => "products#index_4", as: :product_index_4
    get "product/index_5" => "products#index_5", as: :product_index_5
    get "product/index_6" => "products#index_6", as: :product_index_6

    get "customer/:id/show_profile" => "customers#show_profile", as: :customer_show_profile
    get "customer/:id/likes" => "customers#likes_index", as: :customer_likes_index
    get 'customers/:id/new_profile' => "customers#profile_new", as: :customer_new_profile
    patch 'customers/:id/create_profile' => 'customers#profile_create', as: :customer_create_profile
    get 'customer/complete' => 'customers#complete', as: :customer_complete

    resources :products, only: [:new, :create, :show, :edit, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
      resources :offers
      resource :orders
    end
    get "product/complete" => "products#complete"
    get "product/offer/complete" => "offers#complete"
    delete "product/:product_id/product_images/:product_image_id" => "product_images#destroy", as: :product_image
    get "product/order/complete" => "orders#complete"
  end

  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :destroy, :update] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get "offers" => "offers#offers_index"
      get "offered" => "offers#offered_index"
      get "orders/listing" => "orders#listing"
      get "orders/in_progress" => "orders#in_progress"
      get "orders/completed" => "orders#completed"
    end
    resources :products, only: [:index, :show, :edit,] do
     resources :offers, only: [:show, :destroy]
     resource :orders
    end
    get "customer/:id/likes" => "customers#likes_index", as: :customer_likes_index
  end



  root to: "homes#top"
  get "/about" => "homes#about"
  post "homes/guest_sign_in" => "homes#guest_sign_in"
end
