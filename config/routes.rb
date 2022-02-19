# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :recipes, except: [ :update ] do
    resources :ingredients, controller: 'ingredients', except: [ :index, :show ], shallow: true
  end
  
  resources :foods,:inventories, except: [ :show, :update]

  get 'general_shopping_list', to: 'general_shopping_list#index', as: :shopping_list
  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes
  
  root 'recipes#public_recipes'
  
end
