Rails.application.routes.draw do

  get "/cart", to: "cart#show", as: :cart
  post "/cart/add/:lego_set_id", to: "cart#add", as: :add_to_cart
  get "/cart/remove/:lego_set_id", to: "cart#remove", as: :remove_from_cart

  resources :cart, only: [:show] do
    patch :update, on: :collection, as: :update
  end

  get "static_pages/show"
  get "reviews/create"
  get "lego_sets/index"
  get "lego_sets/show"
  get "pages/home"
  get "/pages/:slug", to: "static_pages#show", as: :static_page

  root "pages#home"           # Homepage route
  resources :lego_sets, only: [:index, :show] do
    resources :reviews, only: [:create]
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA dynamic files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
