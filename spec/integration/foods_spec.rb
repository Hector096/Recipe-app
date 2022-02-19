require 'rails_helper'

RSpec.describe 'Foods Index Page Features', type: :feature do
  before(:each) do
    visit user_session_path
    @vladmir = User.create!(
      name: 'Vladmir', email: 'vladmir@test.com', password: 'vladmir123'
    )
    fill_in 'Email', with: 'vladmir@test.com'
    fill_in 'Password', with: 'vladmir123'
    click_button 'Log in'

    @soya_beans = @vladmir.foods.create!(name: 'Soya Beans', price: 3.5, measurement_unit: 'kg')
    visit foods_path
  end

  describe 'Index Page Contents' do
    it 'can see the contents of the page' do
      expect(page).to have_content 'Soya Beans'
    end

    it 'should see the price of a particular food item' do
      expect(page).to have_content '3.5'
    end

    it 'should see the measurement unit of a particular food item' do
      expect(page).to have_content 'kg'
    end

    it 'should see a link to delete a food item on the page' do
      expect(page).to have_link('Delete')
    end

    it 'should see a link to add food item' do
      expect(page).to have_link('Add Food')
    end

    it 'When I click on add food link, it redirects me to a page fr adding a food item' do
      click_link('Add Food')
      expect(page).to have_current_path(new_food_url)
    end

    it 'When I click on add food link, it redirects me to a page fr adding a food item' do
      click_link('Delete')
      expect(@vladmir.foods.size).to eql 0
      expect(page).to_not have_content('Soya Beans')
    end
  end
end
