require 'customer_order'
require 'menu_item'
require 'menu'

describe CustomerOrder do
  context 'multiple selected items' do
    it 'Should add a selected dish from menu and display it as a formatted string' do
      dish1 = double(:item, dish_name: 'Curry Goat', dish_price: 10.00, dish_type: :main_course, dish_stock: 10)
      dish2 = double(:item, dish_name: 'Mash', dish_price: 3.99, dish_type: :starter, dish_stock: 5)
      dish3 = double(:item, dish_name: 'Tiramisu', dish_price: 4.99, dish_type: :dessert, dish_stock: 3)
      dish4 = double(:item, dish_name: 'Big bit of Salmon', dish_price: 12.50, dish_type: :main_course, dish_stock: 6)
      allow(dish1).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish2).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish3).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish4).to receive(:is_a?).with(MenuItem).and_return(true)
      menu1 = Menu.new
      menu1.add_menu_item(dish1)
      menu1.add_menu_item(dish2)
      menu1.add_menu_item(dish3)
      menu1.add_menu_item(dish4)
      order1 = CustomerOrder.new
      order1.select_dish(menu1, 'Curry Goat')
      expect(order1.show_selected_items).to eq ("Current order:\nCurry Goat - £10.00")
    end

    it 'Should correctly display and update the selected items' do
      dish1 = double(:item, dish_name: 'Curry Goat', dish_price: 10.00, dish_type: :main_course, dish_stock: 10)
      dish2 = double(:item, dish_name: 'Mash', dish_price: 3.99, dish_type: :starter, dish_stock: 5)
      dish3 = double(:item, dish_name: 'Tiramisu', dish_price: 4.99, dish_type: :dessert, dish_stock: 3)
      dish4 = double(:item, dish_name: 'Big bit of Salmon', dish_price: 12.50, dish_type: :main_course, dish_stock: 6)
      allow(dish1).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish2).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish3).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish4).to receive(:is_a?).with(MenuItem).and_return(true)
      menu1 = Menu.new
      menu1.add_menu_item(dish1)
      menu1.add_menu_item(dish2)
      menu1.add_menu_item(dish3)
      menu1.add_menu_item(dish4)
      order1 = CustomerOrder.new
      order1.select_dish(menu1, 'Curry Goat')
      expect(order1.show_selected_items).to eq ("Current order:\nCurry Goat - £10.00")
      order1.select_dish(menu1, 'Tiramisu')
      order1.select_dish(menu1, 'Big bit of Salmon')
      expect(order1.show_selected_items).to eq ("Current order:\nCurry Goat - £10.00\nTiramisu - £4.99\nBig bit of Salmon - £12.50")
    end

    it 'Should return a formatted receipt showing the total cost of selected items' do
      dish1 = double(:item, dish_name: 'Curry Goat', dish_price: 10.00, dish_type: :main_course, dish_stock: 10)
      dish2 = double(:item, dish_name: 'Mash', dish_price: 3.99, dish_type: :starter, dish_stock: 5)
      dish3 = double(:item, dish_name: 'Tiramisu', dish_price: 4.99, dish_type: :dessert, dish_stock: 3)
      dish4 = double(:item, dish_name: 'Big bit of Salmon', dish_price: 12.50, dish_type: :main_course, dish_stock: 6)
      allow(dish1).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish2).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish3).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish4).to receive(:is_a?).with(MenuItem).and_return(true)
      menu1 = Menu.new
      menu1.add_menu_item(dish1)
      menu1.add_menu_item(dish2)
      menu1.add_menu_item(dish3)
      menu1.add_menu_item(dish4)
      order1 = CustomerOrder.new
      order1.select_dish(menu1, 'Curry Goat')
      order1.select_dish(menu1, 'Mash')
      order1.select_dish(menu1, 'Tiramisu')
      expect(order1.show_receipt).to eq "Receipt:\nCurry Goat - £10.00\nMash - £3.99\nTiramisu - £4.99\nTotal cost: £18.98"
    end
  end
end
