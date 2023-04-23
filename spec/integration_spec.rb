require 'customer_order'
require 'menu_item'
require 'menu'

describe CustomerOrder do
  context 'multiple selected items' do
    it 'Should add a selected dish from menu to the selected items array' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      item_2 = MenuItem.new("Mash", 3.99, :starter, 5)
      item_3 = MenuItem.new("Tiramisu", 4.99, :dessert, 3)
      item_4 = MenuItem.new( "Big bit of Salmon", 12.50, :main_course, 6)
      menu_1 = Menu.new
      menu_1.add_menu_item(item_1)
      menu_1.add_menu_item(item_2)
      menu_1.add_menu_item(item_3)
      menu_1.add_menu_item(item_4)
      order_1 = CustomerOrder.new
      order_1.select_dish(menu_1, "Curry Goat")
      order_1.select_dish(menu_1, "Tiramisu")
      expect(order_1.show_selected_items).to eq [item_1, item_3]
    end

    it 'Should return a formatted receipt showing the total cost of selected items' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      item_2 = MenuItem.new("Mash", 3.99, :starter, 5)
      item_3 = MenuItem.new("Tiramisu", 4.99, :dessert, 3)
      item_4 = MenuItem.new( "Big bit of Salmon", 12.50, :main_course, 6)
      menu_1 = Menu.new
      menu_1.add_menu_item(item_1)
      menu_1.add_menu_item(item_2)
      menu_1.add_menu_item(item_3)
      menu_1.add_menu_item(item_4)
      order_1 = CustomerOrder.new
      order_1.select_dish(menu_1, "Curry Goat")
      order_1.select_dish(menu_1, "Mash")
      order_1.select_dish(menu_1, "Tiramisu")
      expect(order_1.show_receipt).to eq "Receipt:\nCurry Goat - £10.0\nMash - £3.99\nTiramisu - £4.99\nTotal cost: £18.98"
    end
  end
end