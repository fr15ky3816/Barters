Rails.application.routes.draw do

  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        passwords: "admins/passwords",
        registrations: "admins/registrations"
      }



  devise_for :customers, skip: :all
    devise_scope :customer do
      get '/customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
      post '/customers', to: 'public/registrations#create', as: :customer_registration
      get "/customers/sign_in", to: "public/sessions#new", as: :new_customer_session
      post "/customers/sign_in", to: "public/sessions#create",as: :customer_session
      delete "/customers/sign_out", to: "public/sessions#destroy",as: :destroy_customer_session
    end

  scope module: :public do
    resources :customers
    get "/customer/:id/show_profile" => "customers#show_profile", as: :customer_show_profile
    resources :products, only: [:new, :create, :index, :show, :destroy]
    get "/product/complete" => "products#complete"
  end


  root to: "homes#top"
  get "/about" => "homes#about"





end
