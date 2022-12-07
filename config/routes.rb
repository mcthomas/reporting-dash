Rails.application.routes.draw do
  get 'channelplans/dashboard' => 'channelplans#dashboard', :as => :dashboard
  resources :channelplans, :userreports, :elgibilitylists
  resources :entries, only: [], param: :index do
    member do
      delete '(:id)' => "entries#destroy", as: ""
      post '/' => "entries#create"
    end
  end
  root "channelplans#index"
end
