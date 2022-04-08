Rails.application.routes.draw do
  root to: "blogs#index"
resources :blogs do
    collection do
      post :confirm

    end
   end
   resources :sessions, only: [:new, :create, :destroy]
   resources :users
 end
