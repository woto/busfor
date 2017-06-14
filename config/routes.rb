Rails.application.routes.draw do
  resources :routes
  get 'welcome/index'
  resources :carriers
  resources :stations
  resources :cities
  root "welcome#index"
end
