Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users do
      member do
        patch :unsubscribe
      end  
    end
    resources :posts
    resources :comments
  end

  scope module: :public do
    get "search" => "posts#search"
    resources :users do
      member do
        get :favorites
      end
    end

    resources :posts do
       resource :favorites, only: [:create, :destroy]
       resources :comments, only: [:create]
    end

  end

  root to: 'homes#top'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
end
