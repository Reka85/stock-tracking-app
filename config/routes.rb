Rails.application.routes.draw do
  devise_for :users

  # Sidekiq UI for admins
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  resources :stocks, only: [:index, :show]
end
