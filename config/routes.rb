Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :public_recipes, only: %i[index]
  resources :general_shopping_lists, only: %i[index]

  resources :recipes, only: %i[index new create show destroy] do
    resources :recipes_foods, only: %i[new create]
  end

  resources :users, only: %i[index show] do
    resources :foods, only: %i[index new create destroy]
    resources :recipes, only: %i[index new create show destroy] do
      resources :recipe_foods, only: %i[new create]
    end
  end

  root to: 'users#index'
end
