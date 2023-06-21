require_relative './lib/customer_order'
require_relative './lib/menu_item'
require_relative './lib/menu'

item_1 = MenuItem.new('Curry Goat', 10.00, :main_course, 10)
item_2 = MenuItem.new('Mash', 3.99, :starter, 5)
item_3 = MenuItem.new('Tiramisu', 4.99, :dessert, 3)
item_4 = MenuItem.new('Big bit of Salmon', 12.50, :main_course, 6)
item_5 = MenuItem.new('Coq au Vin', 29.90, :main_course, 10)
item_6 = MenuItem.new('Beans', 1.99, :starter, 4)
item_7 = MenuItem.new('Key Lime Pie', 4.99, :dessert, 5)
item_8 = MenuItem.new('Stew', 10.47, :main_course, 1)
menu_1 = Menu.new
menu_1.add_menu_item(item_1)
menu_1.add_menu_item(item_2)
menu_1.add_menu_item(item_3)
menu_1.add_menu_item(item_4)
menu_1.add_menu_item(item_5)
menu_1.add_menu_item(item_6)
menu_1.add_menu_item(item_7)
menu_1.add_menu_item(item_8)
print menu_1.display_partial_menu(:starter)
puts "\n------------------------------"
print menu_1.display_partial_menu(:main_course)
puts "\n------------------------------"
print menu_1.display_partial_menu(:dessert)

# Customer order functionality:

order_1 = CustomerOrder.new
order_1.select_dish(menu_1, "Curry Goat")
order_1.select_dish(menu_1, "Mash")
order_1.select_dish(menu_1, "Tiramisu")
puts "\n-----------------------------"
print order_1.show_selected_items
order_1.select_dish(menu_1, "Stew")
order_1.select_dish(menu_1, "Beans")
puts "\n-----------------------------"
print order_1.show_receipt
