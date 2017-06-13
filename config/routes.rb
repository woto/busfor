Rails.application.routes.draw do
  get 'welcome/index'
  resources :carriers
  resources :stations
  resources :cities
  root "welcome#index"
end
