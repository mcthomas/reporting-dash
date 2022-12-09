Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'manage' => 'users#manage', :as => :manage
  get 'channelplans/dashboard' => 'channelplans#dashboard', :as => :dashboard
  resources :channelplans, :userreports, :elgibilitylists
  resources :eligibilitylists do
    collection do
      post :import
    end
  end
  root "channelplans#index"
end
