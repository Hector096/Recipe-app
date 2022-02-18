# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
chris = User.create!(name: 'chris', email: 'chris2@test.com', password: 'chris123')
kate = User.create!(name: 'kate', email: 'kate2@test.com', password: 'kate123')

rice = chris.foods.create!(name: 'Rice', price: 1.5, measurement_unit: 'kg')
apple = chris.foods.create!(name: 'Apple', price: 0.2, measurement_unit: 'g')
chicken_breasts = chris.foods.create!(name: 'Chicken breasts', price: 3.5, measurement_unit: 'units')

recipe = chris.recipes.create!(name: 'Chicken Tandoori', preparation_time: 15, cooking_time: 50, description: 'Tandoori chicken is a chicken dish prepared by roasting chicken marinated in yogurt and spices in a tandoor, a cylindrical clay oven.', public: true)
recipe.add_ingredient(rice, 3)
recipe.add_ingredient(apple, 6)

recipe2 = kate.recipes.create!(name: 'Pizza', preparation_time: 25, cooking_time: 120, description: 'Classic Hawaiian Pizza combines pizza sauce, cheese, cooked ham, and pineapple. This crowd-pleasing pizza recipe starts with my homemade pizza crust and is finished with a sprinkle of crispy bacon. It’s salty, sweet, cheesy, and undeniably delicious!', public: true)
flour = chris.foods.create!(name: 'Flour', price: 1.5, measurement_unit: 'kg')
pineapple = kate.foods.create!(name: 'Pineapple', price: 0.4, measurement_unit: 'units')
recipe2.add_ingredient(flour, 3)
recipe2.add_ingredient(pineapple, 5)