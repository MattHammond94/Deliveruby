require 'menu'

describe Menu do
  context 'Multiple items added to menu' do
    it 'Should allow multiple items to be added to the menu' do
      item_1 = double :item_1
      item_2 = double :item_2
      item_3 = double :item_3
      item_4 = double :item_4
      menu_1 = Menu.new
      menu_1.add_menu_item(item_1)
      menu_1.add_menu_item(item_2)
      menu_1.add_menu_item(item_3)
      menu_1.add_menu_item(item_4)
      expect(menu_1.show_menu).to eq [item_1, item_2, item_3, item_4]
    end

    it 'Should remove menu items after remove menu item has been called' do
      item_1 = double :item_1
      item_2 = double :item_2
      item_3 = double :item_3
      item_4 = double :item_4
      menu_1 = Menu.new
      menu_1.add_menu_item(item_1)
      menu_1.add_menu_item(item_2)
      menu_1.add_menu_item(item_3)
      menu_1.add_menu_item(item_4)
      menu_1.remove_menu_item(item_2)
      expect(menu_1.show_menu).to eq [item_1, item_3, item_4]
    end
  end
end
