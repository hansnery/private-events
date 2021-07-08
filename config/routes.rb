require 'sidekiq/web'

Rails.application.routes.draw do
  get 'events/index'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users
  root to: 'home#index'
  resources :events do
    member do
      get 'presence_in'
      get 'send_invite'
    end
  end
  resources :invitations do
    member do
      get 'accept'
      get 'refuse'
    end
  end
  get 'all_events', to: 'events#all_events'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
