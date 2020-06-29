Rails.application.routes.draw do
  scope module: :admins do
    devise_for :admins
  end
  scope module: :customers do
    devise_for :customers
  end

  get "admins/top" => "admins/homes#top"

  patch "customers/leave" => "customers#leave"
  get "customers/confirm" => "customers#confirm"
  resources :customers, only:[:show, :edit, :update]

  namespace :admins do
    resources :customers, only:[:index, :show, :edit, :update]do
    get 'search', on: :collection
  end
  end

  resources :deliveries, only:[:index, :create, :edit, :update, :destroy]

  post "orders/confirm" => "orders#confirm"
  get "orders/finish" => "orders#finish"
  resources :orders, only:[:index, :show, :new, :create]

  namespace :admins do
    resources :orders, only:[:index, :show, :update]
  end

  delete "cart_items/empty" => "cart_items#empty"
  resources :cart_items, only:[:index, :create, :update, :destroy]

  namespace :admins do
    resources :order_products, only:[:update]
  end

  root "products#top"
  resources :products, only:[:index, :show]


  namespace :admins do
    resources :products, only:[:index, :show, :create, :new, :edit, :update] do
    get 'search', on: :collection
  end
  end

  namespace :admins do
    resources :genres, only:[:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
