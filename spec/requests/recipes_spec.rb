require 'rails_helper'

describe 'Testing Recipes pages', type: :request do
  before(:each) do
    @user = User.create!(name: 'matt', email: 'matt@test.com', password: 'matt123')
    @recipe = @user.recipes.create!(
      name: 'Pizza', preparation_time: 25,
      cooking_time: 120, description: 'Classic Hawaiian Pizza!',
      public: true
    )
    login_as @user
  end

  describe 'GET #index page' do
    before(:each) { get recipes_url }
    it 'should return correct response' do
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
    it 'should have the text from food name' do
      expect(response.body).to include('Pizza')
    end
    it 'should have the text from description' do
      expect(response.body).to include('Classic Hawaiian Pizza!')
    end
  end

  describe 'GET #show page' do
    before(:each) { get recipe_url(@recipe) }
    it 'should return correct response' do
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end
    it 'should have the text Generate shopping list' do
      expect(response.body).to include('Generate shopping list')
    end
    it 'should have the text of the food name' do
      expect(response.body).to include('Generate shopping list')
    end
  end
end
