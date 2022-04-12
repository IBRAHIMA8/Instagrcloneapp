Rails.application.routes.draw do
root to: "users#new"
resources :blogs do
  post 'like', to: 'favorites#create'
  delete '/like', to: 'favorites#destroy'
    collection do
      post :confirm

    end
   end
   resources :sessions, only: [:new, :create, :destroy]
   resources :users do
     member do
      get :like
    end
   end

   mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
   resources :favorites, only: [:create, :destroy]
 end
