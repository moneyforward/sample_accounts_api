Rails.application.routes.draw do
  resources :users, shallow: true, only: [:show] do
    resources :accounts, only: [:index, :show]
  end
end
