# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

food = Category.create!(name: "Food")
travel = Category.create!(name: "Travel")
subscription = Category.create!(name: "Subscription")
sports = Category.create!(name: "Sports")
clothing = Category.create!(name: "Clothing")
gaming = Category.create!(name: "Gaming")

Expense.create!(
  amount: 30,
  description: "Spotify",
  spent_on: Date.today,
  category: subscription
)