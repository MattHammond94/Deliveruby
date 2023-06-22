require_relative './lib/customer_order'
require_relative './lib/menu_item'
require_relative './lib/menu'
require_relative './lib/order_confirmation'
require_relative './lib/twilio_details'

item1 = MenuItem.new('Curry Goat', 10.00, :main_course, 10)
item2 = MenuItem.new('Mash', 3.99, :starter, 5)
item3 = MenuItem.new('Tiramisu', 4.99, :dessert, 3)
item4 = MenuItem.new('Big bit of Salmon', 12.50, :main_course, 6)
item5 = MenuItem.new('Coq au Vin', 29.90, :main_course, 10)
item6 = MenuItem.new('Beans', 1.99, :starter, 4)
item7 = MenuItem.new('Key Lime Pie', 4.99, :dessert, 5)
item8 = MenuItem.new('Stew', 10.47, :main_course, 1)
item9 = MenuItem.new('Breadstick(singular)', 1.00, :starter, 10)
menu1 = Menu.new
menu1.add_menu_item(item1)
menu1.add_menu_item(item2)
menu1.add_menu_item(item3)
menu1.add_menu_item(item4)
menu1.add_menu_item(item5)
menu1.add_menu_item(item6)
menu1.add_menu_item(item7)
menu1.add_menu_item(item8)
menu1.add_menu_item(item9)
print menu1.display_partial_menu(:starter)
puts "\n------------------------------"
print menu1.display_partial_menu(:main_course)
puts "\n------------------------------"
print menu1.display_partial_menu(:dessert)

# Customer order functionality:
order1 = CustomerOrder.new
# order1.select_dish(menu1, 'Curry Goat')
# order1.select_dish(menu1, 'Mash')
# order1.select_dish(menu1, 'Tiramisu')
order1.select_dish(menu1, 'Mash')
order1.select_dish(menu1, 'Curry Goat')
order1.select_dish(menu1, 'Tiramisu')
# puts "\n-----------------------------"
# print order_1.show_selected_items
# order1.select_dish(menu1, 'Stew')
# order1.select_dish(menu1, 'Beans')
# order1.select_dish(menu1, 'Breadstick(singular)')
puts "\n-----------------------------"
# print order1.show_receipt

details = TwilioDetails.new
confirmation = OrderConfirmation.new(details, order1)
confirmation.send_message

# puts confirmation.send_message.sid
# puts confirmation.send_message.direction
# puts confirmation.send_message.price_unit
# puts confirmation.send_message.date_created
