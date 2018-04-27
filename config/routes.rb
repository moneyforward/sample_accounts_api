Rails.application.routes.draw do
  root to: 'home#index'

  scope module: :api do
    resources :users, shallow: true, only: [:show] do
      resources :accounts, only: [:index, :show]
    end
  end
end
