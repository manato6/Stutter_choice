Rails.application.routes.draw do
  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  get 'homes/top'
  
  namespace :admin do
    resources :users
    resources :posts
    resources :comments
  end
    
  
  scope module: :public do
    resources :users
    resources :posts
    resources :favorites
    resources :comments
  end
end
