# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all the previous seeds"
Item.destroy_all
Restaurant.destroy_all
Table.destroy_all


puts "creating 2 restaurant2"
resto1 = Restaurant.new(name: "Be Burger", address: "Hector Henneaulaan 164, 1930 Zaventem")
resto2 = Restaurant.new(name: "Le schievelavabo", address: "Rue du Collège St Michel 52, 1150 Woluwe-Saint-Pierre")
resto1.save!
resto2.save!
puts "resto #{resto1.id} & #{resto2.id} created"


puts "creating tables for restaurant#{resto1.id} & restaurant#{resto2.id}"
table1 = Table.new(table_number: "1",capacity: 14)
table2 = Table.new(table_number: "2",capacity: 11)
table3 = Table.new(table_number: "3",capacity: 30)
table4 = Table.new(table_number: "4",capacity: 5)
table5 = Table.new(table_number: "5",capacity: 8)
table6 = Table.new(table_number: "6",capacity: 9)
table7 = Table.new(table_number: "7",capacity: 2)
table8 = Table.new(table_number: "8",capacity: 23)
table9 = Table.new(table_number: "9",capacity: 21)
table10 = Table.new(table_number: "10",capacity: 12)

table11 = Table.new(table_number: "1",capacity: 14)
table12 = Table.new(table_number: "2",capacity: 11)
table13 = Table.new(table_number: "3",capacity: 20)
table14 = Table.new(table_number: "4",capacity: 5)
table15 = Table.new(table_number: "5",capacity: 8)
table16 = Table.new(table_number: "6",capacity: 8)
table17 = Table.new(table_number: "7",capacity: 2)
table18 = Table.new(table_number: "8",capacity: 4)

table1.restaurant = resto1
table2.restaurant = resto1
table3.restaurant = resto1
table4.restaurant = resto1
table5.restaurant = resto1
table6.restaurant = resto1
table7.restaurant = resto1
table8.restaurant = resto1
table9.restaurant = resto1
table10.restaurant = resto1

table11.restaurant = resto2
table12.restaurant = resto2
table13.restaurant = resto2
table14.restaurant = resto2
table15.restaurant = resto2
table16.restaurant = resto2
table17.restaurant = resto2
table18.restaurant = resto2

table1.save!
table2.save!
table3.save!
table4.save!
table5.save!
table6.save!
table7.save!
table8.save!
table9.save!
table10.save!
table11.save!
table12.save!
table13.save!
table14.save!
table15.save!
table16.save!
table17.save!
table18.save!


#################################################################################################
# BE burger
#################################################################################################
puts "creating 3 starters  for Be burgers"

starter1 = Item.new(name: "Salad", description: "Classic salad", price: 3.50, category: "starters")
starter1.restaurant = resto1
starter1.save!

starter2 = Item.new(name: "Mediterranean salad", description: "Classic salad with feta and black olives", price: 5.00, category: "starters")
starter2.restaurant = resto1
starter2.save!

starter3 = Item.new(name: "Chicken salad", description: "Classic salad with chicken", price: 6.50, category: "starters")
starter3.restaurant = resto1
starter3.save!

puts "3 starters created"

puts "creating 3 burgers for BE BURGER"
burger1 = Item.new(name: "Hamburger", description: "Black Angus beef, Iceberg lettuce, Homemade sauce", price: 8.50, category: "burgers")
burger1.restaurant = resto1
burger1.save!

burger2 = Item.new(name: "Cheese burger", description: "Black Angus beef, Iceberg lettuce, Giant sauce, Cheese", price: 10.00, category: "burgers")
burger2.restaurant = resto1
burger2.save!

burger3 = Item.new(name: "Bacon burger", description: "Black Angus beef, Iceberg lettuce, BBQ sauce, Bacon", price: 11.50, category: "burgers")
burger3.restaurant = resto1
burger3.save!

puts "3 burgers created"

puts"creating 3 sides for BE BURGER"
side1 = Item.new(name: "Belgian Fries", description: "Portion French fries", price: 3.50, category: "sides")
side1.restaurant = resto1
side1.save!

side2 = Item.new(name: "Cheese croquettes", description: "Mini cheese croquettes", price: 6.50, category: "sides")
side2.restaurant = resto1
side2.save!

side3 = Item.new(name: "Onion rings", description: "Smoked onion rings & barbecue sauce", price: 6.50, category: "sides")
side3.restaurant = resto1
side3.save!

puts"creating 3 drinks"
drink1 = Item.new(name: "Coca-Cola", description: "Coca-Cola", price: 1.50, category: "drinks")
drink1.restaurant = resto1
drink1.save!

drink2 = Item.new(name: "Fanta", description: "Fanta", price: 1.50, category: "drinks")
drink2.restaurant = resto1
drink2.save!

drink3 = Item.new(name: "Sprite", description: "Sprite", price: 1.50, category: "drinks")
drink3.restaurant = resto2
drink3.save!
puts"3 sides created"





#################################################################################################
# schievelavabo
#################################################################################################
entree1 = Item.new(name: "Véritable servelat", description: "", price: 4.5, category: "POUR PATIENTER")
entree1.restaurant = resto2
entree1.save!

entree2 = Item.new(name: "Saucissson artisanal aux noisettes", description: "", price: 4.5, category: "POUR PATIENTER")
entree2.restaurant = resto2
entree2.save!

entree3 = Item.new(name: "Terrine au piment d’Espelette", description: "", price: 5.0, category: "POUR PATIENTER")
entree3.restaurant = resto2
entree3.save!

entree4 = Item.new(name: "Boîte de sardines, le top d’Espagne", description: "", price: 7.0, category: "POUR PATIENTER")
entree4.restaurant = resto2
entree4.save!

entree5 = Item.new(name: "Moules à l’Escavèche", description: "", price: 7.0, category: "POUR PATIENTER")
entree5.restaurant = resto2
entree5.save!

entree6 = Item.new(name: "Fondus au fromage artisanal", description: "pour 2 personnes", price: 9.5, category: "ENTREE")
entree5.restaurant = resto2
entree5.save!

entree7 = Item.new(name: "Fondus Parmesan en robe de nuit", description: "", price: 10.5, category: "ENTREE")
entree5.restaurant = resto2
entree5.save!

entree8 = Item.new(name: "Croquettes artisanales crevettes grises", description: "2 personnes", price: 13.0, category: "ENTREE")
entree5.restaurant = resto2
entree5.save!

plat1 = Item.new(name: "Jambon-fromage", description: "", price: 11.0, category: "PASTA")
plat1.restaurant = resto2
plat1.save!

plat2 = Item.new(name: "Macaroni “gratiné”", description: "", price: 12.0, category: "PASTA")
plat2.restaurant = resto2
plat2.save!

plat3 = Item.new(name: "Tagliatelles aux scampi sauce diable", description: "", price: 14.5, category: "PASTA")
plat3.restaurant = resto2
plat3.save!

puts"finished!"
