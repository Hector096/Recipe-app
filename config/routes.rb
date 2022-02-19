# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :recipes, except: [ :update ] do
    resources :ingredients, controller: 'ingredients', except: [ :index, :show ], shallow: true
    resources :general_shopping_lists, only: [:index]
  end
  
  resources :foods, except: [ :show, :update]

  resources :inventories, except: [:update] do
    resources :food_inventories, only: [:new, :create, :destroy]
  end

  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes
  
  root 'recipes#public_recipes'
  
end
