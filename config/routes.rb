Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :profit_and_loss, only: [:index]
    end
  end
end
