Rails.application.routes.draw do
  resources :teachers
  resources :courses
  root 'courses#index'
end
