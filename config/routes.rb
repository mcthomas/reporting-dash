Rails.application.routes.draw do
  get 'channelplans/dashboard' => 'channelplans#dashboard', :as => :dashboard
  resources :channelplans, :userreports, :elgibilitylists
  root "channelplans#index"
end
