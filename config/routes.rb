require 'sidekiq/web'

Rails.application.routes.draw do
  get 'events/index'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users
  root to: 'home#index'
  resources :events
  resources :invitations  #, only: [:create, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
