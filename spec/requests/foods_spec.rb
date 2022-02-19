require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before :each do
    user = User.create!(name: 'Al', email: 'al@example.com', password: 'password')
    login_as user
  end

  describe 'GET /index' do
    it 'tests the URL path for foods#index' do
      get foods_url
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('Measurement Unit')
    end
  end

  describe 'Foods/new' do
    it 'tests the URL path for foods#index' do
      get new_food_url
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
      expect(response.body).to include('Price')
    end
  end
end
