Rails.application.routes.draw do
  get "cart/show"
  get "cart/add"
  get "cart/remove"
  get "static_pages/show"
  get "reviews/create"
  get "lego_sets/index"
  get "lego_sets/show"
  get "pages/home"
  get "/pages/:slug", to: "static_pages#show", as: :static_page

  root "pages#home"           # Homepage route
  resources :lego_sets, only: [:index, :show]

  resources :lego_sets, only: [:index, :show] do
    resources :reviews, only: [:create]
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
