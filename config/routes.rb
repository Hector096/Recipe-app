# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :recipes, except: [ :update ] do
    resources :ingredients, controller: 'ingredients', except: [ :index, :show ], shallow: true
    resources :general_shopping_lists, only: [:index]
  end
  
  resources :foods,:inventories, except: [ :show, :update]

  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes
  
  root 'recipes#public_recipes'
  
end
