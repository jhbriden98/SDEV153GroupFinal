Rails.application.routes.draw do
  devise_for :users
  resources :teachers
  resources :courses do
    member do
      get :addcourse
      get :removecourse
      get :courselist
      
    end
  end
  root to: 'courses#index'
  match 'search', to: 'courses#search', via: :get
  match 'search', to: 'teachers#search', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
