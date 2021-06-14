Rails.application.routes.draw do

  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        passwords: "admins/passwords",
        registrations: "admins/registrations"
      }

  devise_for :customers, controllers: {
        sessions: 'customers/sessions',
        passwords: "customers/passwords",
        registrations: "customers/registrations"
      }

  root to: "homes#top"
  get "/about" => "homes#about"

  resources :products, only: [:new, :create, :index, :show, :destroy]
  get "/product/complete" => "products#complete"


end
