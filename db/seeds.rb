# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Inventory.create(name: "Inventory 1", user_id: 1, description: "This is my first inventory")
Inventory.create(name: "Inventory 2", user_id: 1, description: "This is my second inventory")