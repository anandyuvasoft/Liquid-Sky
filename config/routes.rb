Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#main'

  resources :locations, only:[:index] do
    collection do
      post :import
    end
  end

  resources :diseases, only:[:index] do
    collection do
      post :import
    end
  end


end
