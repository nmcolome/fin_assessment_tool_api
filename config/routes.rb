Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :profit_and_loss, only: [:index]
      resources :dashboard, only: [:index]
      resources :dashboard_by_product, only: [:index]
      resources :dashboard_by_cluster_and_product, only: [:index]
    end
  end
end
