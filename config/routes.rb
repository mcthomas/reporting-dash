Rails.application.routes.draw do
  get 'channelplans/dashboard' => 'channelplans#dashboard', :as => :dashboard
  resources :channelplans
  root "channelplans#index"
end
