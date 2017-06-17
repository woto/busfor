Rails.application.routes.draw do
  concern :searchable_by_name do
    collection do
      #get 'search(/:name)', action: :search, as: :search
      get 'search'
    end
  end
  resources :routes
  get 'welcome/index'
  resources :carriers, concerns: :searchable_by_name
  resources :stations, concerns: :searchable_by_name
  resources :cities, concerns: :searchable_by_name
  root "welcome#index"
end
