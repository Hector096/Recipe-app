class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients

  validates :name, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :public, presence: true, inclusion: [true, false]

  def add_ingredient!(food, quantity)
    already_exists = foods.find_by(name: food.name)
    if already_exists
      ingredients.create!(food: already_exists, quantity: quantity) unless already_exists
    else
      ingredients.create!(food: food, quantity: quantity) unless already_exists
    end
  end

  def add_ingredient(food, quantity)
    already_exists = foods.find_by(name: food.name)
    created = ingredients.create(food: food, quantity: quantity) unless already_exists
    created
  end

  def total_food_items
    foods.size
  end

  def total_price
    total = 0
    ingredients.each do |ingredient|
      total += ingredient.food.price * ingredient.quantity
    end
    total
  end
end
