Rails.application.routes.draw do
  get 'pages/index'
  root to: 'listings#index'
  resources :listings
end
