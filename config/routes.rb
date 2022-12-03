Rails.application.routes.draw do
  get 'events/dashboard' => 'events#dashboard', :as => :dashboard
  resources :events
  root "events#index"
end
