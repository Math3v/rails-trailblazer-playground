Rails.application.routes.draw do
  resources :things, only: [:create, :show, :update, :destroy]
end
