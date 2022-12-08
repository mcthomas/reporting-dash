Rails.application.routes.draw do
  get 'channelplans/dashboard' => 'channelplans#dashboard', :as => :dashboard
  resources :channelplans, :userreports, :eligibilitylists
  root "channelplans#index"
end
