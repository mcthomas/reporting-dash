Rails.application.routes.draw do
  get 'channelplans/dashboard' => 'channelplans#dashboard', :as => :dashboard
  resources :channelplans, :userreports, :elgibilitylists
  resources :eligibilitylists do
    collection do
      post :import
    end
  end
  root "channelplans#index"
end
