require 'rails_helper'

describe 'Recipe Show Page', type: :feature do
  before(:each) do
    visit user_session_path
    @mike = User.create!(
      name: 'mike', email: 'mike@test.com', password: 'mike123'
    )
    fill_in 'Email', with: 'mike@test.com'
    fill_in 'Password', with: 'mike123'
    click_button 'Log in'

    @recipe = @mike.recipes.create!(
      name: 'Hawaiian Pizza', preparation_time: 25,
      cooking_time: 120,
      description: 'Classic Hawaiian Pizza combines pizza sauce, cheese, cooked ham, and pineapple.',
      public: true
    )
    apple = @mike.foods.create!(name: 'Apple', price: 1, measurement_unit: 'kg')
    @recipe.add_ingredient!(apple, 4)

    visit recipe_path(@recipe)
    expect(page).to have_current_path(recipe_path(@recipe))
  end

  describe 'I can see' do
    it 'a recipe\'s title.' do
      expect(page).to have_content 'Hawaiian Pizza'
    end

    it 'a link to the general shopping list' do
      expect(page).to have_link 'Generate shopping list'
    end

    it 'test clicking the "Generate shopping list" link redirects me to the shopping list.' do
      click_link 'Generate shopping list'
      expect(page).to have_current_path(shopping_list_path)
    end

    it 'Modify ingredient button redirect to the edit page' do
      expect(page).to have_link 'Modify'
      click_link 'Modify'
      expect(page).to have_current_path(edit_ingredient_path(@recipe.ingredients.first))
    end

    it 'Delete ingredient button to remove the recipe and show flash message' do
      expect(page).to have_link 'Remove'
      click_link 'Remove'
      expect(page).to have_current_path(recipe_path(@recipe))
      expect(page).to have_content 'Deleted ingredient!'
      expect(page).to_not have_link 'Remove'
    end
  end

  describe 'Add ingredient button tests' do
    before(:each) do
      expect(page).to have_link 'Add ingredient'
      click_link 'Add ingredient'
      expect(page).to have_current_path(new_recipe_ingredient_path(@recipe))
    end

    describe 'Succesfully create an ingredient' do
      before(:each) do
        fill_in 'Name', with: 'Pineapple'
        fill_in 'Measurement unit', with: 'kg'
        fill_in 'Price', with: 4
        click_button 'Create Ingredient'
      end
      it 'expect page to redirect back ' do
        expect(page).to have_current_path(recipe_url(@recipe))
      end

      it 'expect ingredient size to go up by one' do
        expect(@recipe.ingredients.size).to eql 2
      end

      it 'expect successful flash message to appear' do
        expect(page).to have_content 'Added ingredient!'
      end
    end
  end
end
