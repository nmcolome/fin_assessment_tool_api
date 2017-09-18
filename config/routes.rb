Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :profit_and_loss, only: [:index]
      resources :dashboard, only: [:index]
      resources :top_customers, only: [:index]
    end
  end
end
