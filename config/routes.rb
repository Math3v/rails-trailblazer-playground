Rails.application.routes.draw do
  resources :things, only: [:create, :show, :update, :destroy] do
    resources :comments, only: :create
  end
end
