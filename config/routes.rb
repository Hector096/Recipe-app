# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :recipes, except: [ :update ] do
    resources :ingredients, controller: 'ingredients', except: [ :index, :show ], shallow: true
  end
  
  resources :foods,:inventories, except: [ :show, :update]
  # Defines the root path route ("/")
  root 'recipes#public_recipes'
  
end
