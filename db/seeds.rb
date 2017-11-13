# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "suppressing all the previous seeds"
Item.destroy_all

puts"creating a restaurant"
resto = Restaurant.new(name: "Be Burger", address: "Hector Henneaulaan 164, 1930 Zaventem")
resto.save!

puts"creating 3 starters"

starter1 = Item.new(name: "Salad", description: "Classic salad", price: 3.50, category: "starters")
starter1.restaurant = resto
starter1.save!

starter2 = Item.new(name: "Mediterranean salad", description: "Classic salad with feta and black olives", price: 5.00, category: "starters")
starter2.restaurant = resto
starter2.save!

starter3 = Item.new(name: "Chicken salad", description: "Classic salad with chicken", price: 6.50, category: "starters")
starter3.restaurant = resto
starter3.save!

puts"3 starters created"

puts"creating 3 burgers"
burger1 = Item.new(name: "Hamburger", description: "Black Angus beef, Iceberg lettuce, Homemade sauce", price: 8.50, category: "burgers")
burger1.restaurant = resto
burger1.save!

burger2 = Item.new(name: "Cheese burger", description: "Black Angus beef, Iceberg lettuce, Giant sauce, Cheese", price: 10.00, category: "burgers")
burger2.restaurant = resto
burger2.save!

burger3 = Item.new(name: "Bacon burger", description: "Black Angus beef, Iceberg lettuce, BBQ sauce, Bacon", price: 11.50, category: "burgers")
burger3.restaurant = resto
burger3.save!

puts"3 burgers created"

puts"creating 3 sides"
side1 = Item.new(name: "Belgian Fries", description: "Portion French fries", price: 3.50, category: "sides")
side1.restaurant = resto
side1.save!

side2 = Item.new(name: "Cheese croquettes", description: "Mini cheese croquettes", price: 6.50, category: "sides")
side2.restaurant = resto
side2.save!

side3 = Item.new(name: "Onion rings", description: "Smoked onion rings & barbecue sauce", price: 6.50, category: "sides")
side3.restaurant = resto
side3.save!

puts"creating 3 drinks"
drink1 = Item.new(name: "Coca-Cola", description: "Coca-Cola", price: 1.50, category: "drinks")
drink1.restaurant = resto
drink1.save!

drink2 = Item.new(name: "Fanta", description: "Fanta", price: 1.50, category: "drinks")
drink2.restaurant = resto
drink2.save!

drink3 = Item.new(name: "Sprite", description: "Sprite", price: 1.50, category: "drinks")
drink3.restaurant = resto
drink3.save!
puts"3 sides created"

puts"finished!"
