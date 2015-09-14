Rails.application.routes.draw do
  resources :urls, only: [:new, :create]

  get 'urls/admin'
  get 'urls/click'
  root 'urls#new'
end
