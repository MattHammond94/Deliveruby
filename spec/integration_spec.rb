require 'customer_order'
require 'menu_item'
require 'menu'

describe CustomerOrder do
  context 'multiple selected items' do
    it 'Should add a selected dish from menu to the selected items array' do
      dish1 = double(:item, dish_name: "Curry Goat", dish_price: 10.00, dish_type: :main_course, dish_stock: 10)
      dish2 = double(:item, dish_name: "Mash", dish_price: 3.99, dish_type: :starter, dish_stock: 5)
      dish3 = double(:item, dish_name: "Tiramisu", dish_price: 4.99, dish_type: :dessert, dish_stock: 3)
      dish4 = double(:item, dish_name: "Big bit of Salmon", dish_price: 12.50, dish_type: :main_course, dish_stock: 6)
      allow(dish1).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish2).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish3).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish4).to receive(:is_a?).with(MenuItem).and_return(true)
      menu_1 = Menu.new
      menu_1.add_menu_item(dish1)
      menu_1.add_menu_item(dish2)
      menu_1.add_menu_item(dish3)
      menu_1.add_menu_item(dish4)
      order_1 = CustomerOrder.new
      order_1.select_dish(menu_1, "Curry Goat")
      order_1.select_dish(menu_1, "Tiramisu")
      expect(order_1.show_selected_items).to eq [dish1, dish3]
    end

    it 'Should return a formatted receipt showing the total cost of selected items' do
      dish1 = double(:item, dish_name: "Curry Goat", dish_price: 10.00, dish_type: :main_course, dish_stock: 10)
      dish2 = double(:item, dish_name: "Mash", dish_price: 3.99, dish_type: :starter, dish_stock: 5)
      dish3 = double(:item, dish_name: "Tiramisu", dish_price: 4.99, dish_type: :dessert, dish_stock: 3)
      dish4 = double(:item, dish_name: "Big bit of Salmon", dish_price: 12.50, dish_type: :main_course, dish_stock: 6)
      allow(dish1).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish2).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish3).to receive(:is_a?).with(MenuItem).and_return(true)
      allow(dish4).to receive(:is_a?).with(MenuItem).and_return(true)
      menu_1 = Menu.new
      menu_1.add_menu_item(dish1)
      menu_1.add_menu_item(dish2)
      menu_1.add_menu_item(dish3)
      menu_1.add_menu_item(dish4)
      order_1 = CustomerOrder.new
      order_1.select_dish(menu_1, "Curry Goat")
      order_1.select_dish(menu_1, "Mash")
      order_1.select_dish(menu_1, "Tiramisu")
      expect(order_1.show_receipt).to eq "Receipt:\nCurry Goat - £10.0\nMash - £3.99\nTiramisu - £4.99\nTotal cost: £18.98"
    end
  end
end