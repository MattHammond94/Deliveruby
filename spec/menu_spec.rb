require 'menu' 

describe Menu do
  context 'Multiple items added to menu' do
    it 'Should allow multiple items to be added to the menu' do
      # item_1 = double :item_1 
      # item_2 = double :item_2
      # item_3 = double :item_3
      # item_4 = double :item_4
      # menu_1 = Menu.new
      # menu_1.add_menu_item(item_1)
      # menu_1.add_menu_item(item_2)
      # menu_1.add_menu_item(item_3)
      # menu_1.add_menu_item(item_4)
      # expect(menu_1.show_menu).to eq [item_1, item_2, item_3, item_4]

      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      item_2 = MenuItem.new("Mash", 3.99, :starter, 5)
      item_3 = MenuItem.new("Tiramisu", 4.99, :dessert, 3)
      item_4 = MenuItem.new( "Big bit of Salmon", 12.50, :main_course, 6)
      menu_1 = Menu.new
      menu_1.add_menu_item(item_1)
      menu_1.add_menu_item(item_2)
      menu_1.add_menu_item(item_3)
      menu_1.add_menu_item(item_4)
      expect(menu_1.show_menu).to eq [item_1, item_2, item_3, item_4]
    end

    it 'Should remove menu items after remove menu item has been called' do
      # item_1 = double :item_1
      # item_2 = double :item_2
      # item_3 = double :item_3
      # item_4 = double :item_4
      # menu_1 = Menu.new
      # menu_1.add_menu_item(item_1)
      # menu_1.add_menu_item(item_2)
      # menu_1.add_menu_item(item_3)
      # menu_1.add_menu_item(item_4)
      # menu_1.remove_menu_item(item_2)
      # expect(menu_1.show_menu).to eq [item_1, item_3, item_4]

      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      item_2 = MenuItem.new("Mash", 3.99, :starter, 5)
      item_3 = MenuItem.new("Tiramisu", 4.99, :dessert, 3)
      item_4 = MenuItem.new( "Big bit of Salmon", 12.50, :main_course, 6)
      menu_1 = Menu.new
      menu_1.add_menu_item(item_1)
      menu_1.add_menu_item(item_2)
      menu_1.add_menu_item(item_3)
      menu_1.add_menu_item(item_4)
      menu_1.remove_menu_item(item_3)
      expect(menu_1.show_menu).to eq [item_1, item_2, item_4]
    end
  end

  context 'fails' do
    it 'Should fail when' do
      item_1 = double item:
      menu_1 = Menu.new
      expect { menu_1.add_menu_item(item_1) }.to raise_error "This is not a valid menu item and cannot be added to the menu"
    end
  end
end

describe 'formatter' do
  it 'Should return a formatted menu' do
    item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
    item_2 = MenuItem.new("Mash", 3.99, :starter, 5)
    item_3 = MenuItem.new("Tiramisu", 4.99, :dessert, 3)
    item_4 = MenuItem.new( "Big bit of Salmon", 12.50, :main_course, 6)
    menu_1 = Menu.new
    menu_1.add_menu_item(item_1)
    menu_1.add_menu_item(item_2)
    menu_1.add_menu_item(item_3)
    menu_1.add_menu_item(item_4)
    expect(menu_1.display_full_menu).to eq ["Curry Goat - £10.0", "Mash - £3.99", "Tiramisu - £4.99", "Big bit of Salmon - £12.5"]
  end
end