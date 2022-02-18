class Food < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :foods_inventories
  has_many :recipes, through: :ingredients
  has_many :inventories, through: :foods_inventories

  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true, inclusion: { in: %w[kg units l ml cl g] }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
