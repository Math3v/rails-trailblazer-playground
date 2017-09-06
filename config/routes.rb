Rails.application.routes.draw do
  post '/things', to: 'things#create'
end
