# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all the previous seeds"
Item.destroy_all
Order.destroy_all
Table.destroy_all
Restaurant.destroy_all

puts "creating 2 restaurant2"
resto1 = Restaurant.new(name: "Burger Palace", address: "Avenue Louise 264, 1000 Bruxelles")
resto2 = Restaurant.new(name: "Pizza Mania", address: "Avenue Ducpétiaux 49, 1060 Saint-Gilles")
# resto3 = Restaurant.new(name: "Il classico", address: "Avenue Emile de Beco 25, 1050 Bruxelles")
resto1.save!
resto2.save!
# resto3.save!
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

table19 = Table.new(table_number: "1",capacity: 14)
table20 = Table.new(table_number: "2",capacity: 11)
table21 = Table.new(table_number: "3",capacity: 20)
table22 = Table.new(table_number: "4",capacity: 5)
table23 = Table.new(table_number: "5",capacity: 8)
table24 = Table.new(table_number: "6",capacity: 8)
table25 = Table.new(table_number: "7",capacity: 2)
table26 = Table.new(table_number: "8",capacity: 4)

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

# table19.restaurant = resto3
# table20.restaurant = resto3
# table21.restaurant = resto3
# table22.restaurant = resto3
# table23.restaurant = resto3
# table24.restaurant = resto3
# table25.restaurant = resto3
# table26.restaurant = resto3

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
# table19.save!
# table20.save!
# table21.save!
# table22.save!
# table23.save!
# table24.save!
# table25.save!
# table26.save!


#################################################################################################
# Burger Palace
#################################################################################################
puts "creating 3 salads for Burger Palace"

salad1 = Item.new(name: "Caesar salad", description: "Grilled chicken / Parmesan cheese / Anchovies / Tomatoes / Romaine lettuce / Croutons / Caesar sauce", price: 12.50, category: "salads")
salad1.restaurant = resto1
salad1.save!

salad2 = Item.new(name: "Fresh salad", description: "Quinoa / Cucumber / Tomatoes / Romaine lettuce / Coriander / Radishes / Marinated onions / Pumpkin seeds / Cashew nuts / Yogurt sauce", price: 13.50, category: "salads")
salad2.restaurant = resto1
salad2.save!

salad3 = Item.new(name: "Fancy salad", description: "Scampi / Quinoa / Guacamole / Tomatoes / Romaine lettuce / Coriander / Radishes / Marinated onions / Feta cheese / Yogurt sauce", price: 15.00, category: "salads")
salad3.restaurant = resto1
salad3.save!

puts "3 salads created"

puts "creating 5 burgers for Burger Palace"
burger1 = Item.new(name: "Belgian burger", description: "Black Angus beef / Bacon / Onion confit with beer / Iceberg lettuce / Belgian cheese / Mayonaise", price: 12.50, category: "burgers")
burger1.restaurant = resto1
burger1.save!

burger2 = Item.new(name: "Bacon burger", description: "Black Angus beef / Bacon / Iceberg lettuce / BBQ sauce", price: 13.50, category: "burgers")
burger2.restaurant = resto1
burger2.save!

burger3 = Item.new(name: "Mexican burger", description: "Black Angus beef / Guacamole / Cheddar cheese / Onions with paprika / Iceberg lettuce / Homemade sauce", price: 14.00, category: "burgers")
burger3.restaurant = resto1
burger3.save!

burger4 = Item.new(name: "Manhattan burger", description: "Black Angus beef / Bacon / Onions with paprika / Tomatoes / Iceberg lettuce / Cheddar cheese / Homemade sauce", price: 14.50, category: "burgers")
burger4.restaurant = resto1
burger4.save!

burger5 = Item.new(name: "Special burger", description: "Black Angus beef / Cheddar/ Fried onions / Tomatoes / Iceberg lettuce / Mayonaise with truffle", price: 15.00, category: "burgers")
burger5.restaurant = resto1
burger5.save!


puts "5 burgers created"

puts"creating 3 sides for Burger Palace"
side1 = Item.new(name: "Belgian Fries", description: "Portion French fries", price: 3.50, category: "sides")
side1.restaurant = resto1
side1.save!

side2 = Item.new(name: "Cheese croquettes", description: "Mini cheese croquettes", price: 6.50, category: "sides")
side2.restaurant = resto1
side2.save!

side3 = Item.new(name: "Onion rings", description: "Smoked onion rings & barbecue sauce", price: 5.00, category: "sides")
side3.restaurant = resto1
side3.save!
puts"3 sides created"

puts"creating 5 drinks for Burger Palace"
drink1 = Item.new(name: "Coca-Cola", description: "", price: 1.50, category: "drinks")
drink1.restaurant = resto1
drink1.save!

drink2 = Item.new(name: "Fanta", description: "", price: 1.50, category: "drinks")
drink2.restaurant = resto1
drink2.save!

drink3 = Item.new(name: "Sprite", description: "", price: 1.50, category: "drinks")
drink3.restaurant = resto1
drink3.save!

drink4 = Item.new(name: "Iced Tea", description: "Homemade Iced tea", price: 3.50, category: "drinks")
drink4.restaurant = resto1
drink4.save!

drink5 = Item.new(name: "Beer", description: "Belgian pils", price: 2.00, category: "drinks")
drink5.restaurant = resto1
drink5.save!

puts"5 drinks created"

#################################################################################################
# Pizza Mania
#################################################################################################

puts "creating 3 starters for Pizza Mania"

starter1 = Item.new(name: "Bruschetta", description: "Bruschetta with tomato and basil", price: 7.50, category: "starters")
starter1.restaurant = resto2
starter1.save!

starter2 = Item.new(name: "Italian platter", description: "Ham, Buffalo Mozzarella and Bresaola", price: 13.50, category: "starters")
starter2.restaurant = resto2
starter2.save!

starter3 = Item.new(name: "Cheese croquettes", description: "Fried Parmesan Cheese croquetes", price: 10.00, category: "starters")
starter3.restaurant = resto2
starter3.save!

puts "3 starters created"

puts "creating 5 pizze for Pizza Mania"
pizza1 = Item.new(name: "Margherita", description: "Tomato / Mozzarella / Oregano", price: 10.00, category: "pizza")
pizza1.restaurant = resto2
pizza1.save!

pizza2 = Item.new(name: "Napoletana", description: "Tomato / Mozzarella / Anchovies / Capers", price: 11.50, category: "pizza")
pizza2.restaurant = resto2
pizza2.save!

pizza3 = Item.new(name: "Siciliana", description: "Tomato / Mozzarella / Salami / Onions / Oregano", price: 12.50, category: "pizza")
pizza3.restaurant = resto2
pizza3.save!

pizza4 = Item.new(name: "Quattro Stagioni", description: "Tomato / Mushrooms / Ham / Mozzarella / Artichokes", price: 14.50, category: "pizza")
pizza4.restaurant = resto2
pizza4.save!

pizza5 = Item.new(name: "Sea food", description: "Tomato / Clams / Mussels / Calamari / Shrimps", price: 15.00, category: "pizza")
pizza5.restaurant = resto2
pizza5.save!

puts"creating 5 softs for Pizza Mania"
soft1 = Item.new(name: "Coca-Cola", description: "", price: 1.50, category: "softs")
soft1.restaurant = resto2
soft1.save!

soft2 = Item.new(name: "Fanta", description: "", price: 1.50, category: "softs")
soft2.restaurant = resto2
soft2.save!

soft3 = Item.new(name: "Sprite", description: "", price: 1.50, category: "softs")
soft3.restaurant = resto2
soft3.save!

soft4 = Item.new(name: "Iced Tea", description: "Homemade Iced tea", price: 3.50, category: "softs")
soft4.restaurant = resto2
soft4.save!

soft5 = Item.new(name: "Beer", description: "Belgian pils", price: 2.00, category: "softs")
soft5.restaurant = resto2
soft5.save!

puts"5 softs created"

puts"creating 4 wines for Pizza Mania"
wine1 = Item.new(name: "Dragani Montepulciano d’Abbruzzo", description: "", price: 19.0, category: "Red Wines")
wine1.restaurant = resto2
wine1.save!

wine2 = Item.new(name: "Chianti Ruffino", description: "", price: 21.0, category: "Red Wines")
wine2.restaurant = resto2
wine2.save!

wine3 = Item.new(name: "Lodola Nuova Ruffino", description: "", price: 22.0, category: "White wines")
wine3.restaurant = resto2
wine3.save!

wine4 = Item.new(name: "Pinot Grigio", description: "", price: 25.0, category: "White wines")
wine4.restaurant = resto2
wine4.save!

puts"4 wines created"

puts"creating 3 desserts for Pizza Mania"

dessert1 = Item.new(name: "Tiramisu", description: "Homemade Tiramisu", price: 6.0, category: "desserts")
dessert1.restaurant = resto2
dessert1.save!

dessert2 = Item.new(name: "Apple Pancake", description: "", price: 8.0, category: "desserts")
dessert2.restaurant = resto2
dessert2.save!

dessert3 = Item.new(name: "Zabaione", description: "Iced Zabaione with Grand Marnier", price: 10.0, category: "desserts")
dessert3.restaurant = resto2
dessert3.save!

puts"3 desserts created"

#################################################################################################
# Schievelavabo
# can be used if French version needed
# if used warning: resto3 and not resto2 anymore
#################################################################################################
# entree1 = Item.new(name: "Véritable servelat", description: "", price: 4.5, category: "POUR PATIENTER")
# entree1.restaurant = resto2
# entree1.save!

# entree2 = Item.new(name: "Saucissson artisanal aux noisettes", description: "", price: 4.5, category: "POUR PATIENTER")
# entree2.restaurant = resto2
# entree2.save!

# entree3 = Item.new(name: "Terrine au piment d’Espelette", description: "", price: 5.0, category: "POUR PATIENTER")
# entree3.restaurant = resto2
# entree3.save!

# entree4 = Item.new(name: "Boîte de sardines, le top d’Espagne", description: "", price: 7.0, category: "POUR PATIENTER")
# entree4.restaurant = resto2
# entree4.save!

# entree5 = Item.new(name: "Moules à l’Escavèche", description: "", price: 7.0, category: "POUR PATIENTER")
# entree5.restaurant = resto2
# entree5.save!

# entree6 = Item.new(name: "Fondus au fromage artisanal", description: "pour 2 personnes", price: 9.5, category: "ENTREE")
# entree5.restaurant = resto2
# entree5.save!

# entree7 = Item.new(name: "Fondus Parmesan en robe de nuit", description: "", price: 10.5, category: "ENTREE")
# entree5.restaurant = resto2
# entree5.save!

# entree8 = Item.new(name: "Croquettes artisanales crevettes grises", description: "2 personnes", price: 13.0, category: "ENTREE")
# entree5.restaurant = resto2
# entree5.save!

# plat1 = Item.new(name: "Jambon-fromage", description: "", price: 11.0, category: "PASTA")
# plat1.restaurant = resto2
# plat1.save!

# plat2 = Item.new(name: "Macaroni “gratiné”", description: "", price: 12.0, category: "PASTA")
# plat2.restaurant = resto2
# plat2.save!

# plat3 = Item.new(name: "Tagliatelles aux scampi sauce diable", description: "", price: 14.5, category: "PASTA")
# plat3.restaurant = resto2
# plat3.save!


######################################################################################################################
# IL CLASSICO
# can be used if French version needed
# if used warning: resto4 and not resto3 anymore
######################################################################################################################

# classico1 = Item.new(name: "Toast Champignons", description: "", price: 8.0, category: "Les Entrées")
# classico1.restaurant = resto3
# classico1.save!

# classico2 = Item.new(name: "Calamars Frits Tartare", description: "", price: 13.0, category: "Les Entrées")
# classico2.restaurant = resto3
# classico2.save!

# classico3 = Item.new(name: "Carpaccio de Boeuf", description: "", price: 13.5, category: "Les Entrées")
# classico3.restaurant = resto3
# classico3.save!

# classico4 = Item.new(name: "Aubergines Parmigiana", description: "", price: 12.0, category: "Les Entrées")
# classico4.restaurant = resto3
# classico4.save!

# classico5 = Item.new(name: "Penne Arrabiata", description: "", price: 9.5, category: "Les Pâtes")
# classico5.restaurant = resto3
# classico5.save!

# classico5 = Item.new(name: "Penne Quattro Formaggi", description: "", price: 13.0, category: "Les Pâtes")
# classico5.restaurant = resto3
# classico5.save!

# classico6 = Item.new(name: "Tortellini San Daniele", description: "", price: 14.0, category: "Les Pâtes")
# classico6.restaurant = resto3
# classico6.save!

# classico7 = Item.new(name: "Tagliatelle au Saumon", description: "", price: 14.0, category: "Les Pâtes")
# classico7.restaurant = resto3
# classico7.save!

# classico8 = Item.new(name: "Spaghetti Vongole fraiche", description: "", price: 19.5, category: "Les Pâtes")
# classico8.restaurant = resto3
# classico8.save!

# classico9 = Item.new(name: "Margherita", description: "(Tomate, mozzarella)", price: 8.0, category: "Les Pizzas")
# classico9.restaurant = resto3
# classico9.save!

# classico10 = Item.new(name: "Ardi", description: "(Tomate, mozzarella, champignons)", price: 9.0, category: "Les Pizzas")
# classico10.restaurant = resto3
# classico10.save!

# classico11 = Item.new(name: "Zoni", description: "(Tomate mozzarella, jambon)", price: 9.5, category: "Les Pizzas")
# classico11.restaurant = resto3
# classico11.save!

# classico12 = Item.new(name: "Siciliana", description: "(Tomate, mozzarella, jambon, salami piquant)", price: 9.0, category: "Les Pizzas")
# classico12.restaurant = resto3
# classico12.save!

# classico13 = Item.new(name: "Napoletana", description: "(Tomate, mozzarella, anchois, olives, câpres)", price: 9.5, category: "Les Pizzas")
# classico13.restaurant = resto3
# classico13.save!

# classico14 = Item.new(name: "Capricciosa", description: "(Tomate, mozzarella, jambon, poivrons, olives, salami piquant)", price: 10.5, category: "Les Pizzas")
# classico14.restaurant = resto3
# classico14.save!

# classico15 = Item.new(name: "Dragani Montepulciano d’Abbruzzo", description: "", price: 19.0, category: "Vins rouges")
# classico15.restaurant = resto3
# classico15.save!

# classico16 = Item.new(name: "Chianti Ruffino", description: "", price: 21.0, category: "Vins rouges")
# classico16.restaurant = resto3
# classico16.save!

# classico17 = Item.new(name: "Lodola Nuova Ruffino", description: "", price: 29.0, category: "Vins blancs")
# classico17.restaurant = resto3
# classico17.save!

puts "creating orders for the database for the number of orders"

Table.all.each do |table|
  order1 = Order.new(status: "deleted", number: 0)
  order2 = Order.new(status: "deleted", number: 0)
  order1.table = table
  order2.table = table
  order1.save!
  order2.save!
end

puts"finished!"
