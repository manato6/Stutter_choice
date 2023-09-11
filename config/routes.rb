Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users
    resources :posts
    resources :comments
  end

  scope module: :public do
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
end
