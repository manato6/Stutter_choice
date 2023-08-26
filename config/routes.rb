Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'homes/top'
end
