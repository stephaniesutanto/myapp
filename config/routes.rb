Rails.application.routes.draw do
  resources :bucketlists
  root 'bucketlists#index'
end
