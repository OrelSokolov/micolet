Rails.application.routes.draw do
  resources :leads, only: [:new, :create, :index]

  root to: 'leads#new'
end
