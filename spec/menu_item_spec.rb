require 'menu_item'

describe MenuItem do
  context 'Functionality' do
    it 'Should return a hash of given values' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      expect(item_1.show_item).to eq ({ dish: "Curry Goat", price: 10.00, type: :main_course, stock_count: 10 })
    end
  end

  context 'Should fail' do
    it 'Should fail when a non string value is passed for dish when creating new item' do
      expect { item_1 = MenuItem.new(:symbol, 10.00, :main_course, 10) }.to raise_error "This is not a valid input type for dish."
      expect { item_2 = MenuItem.new(nil, 10.00, :main_course, 10) }.to raise_error  "This is not a valid input type for dish."
      expect { item_2 = MenuItem.new("", 10.00, :main_course, 10) }.to raise_error  "This is not a valid input type for dish."
    end

    it 'Should fail when a non float value is passed for  when creating new item' do
      expect { item_1 = MenuItem.new("Curry Goat", nil, :main_course, 10) }.to raise_error "This is not a valid input type for price."
      expect { item_2 = MenuItem.new("Sandwich", 8, :main_course, 10) }.to raise_error "This is not a valid input type for price."
    end

    it 'Should fail when value passed as type at initialize is not a valid symbol' do
      expect { item_1 = MenuItem.new("Curry Goat", 10.50, nil, 10) }.to raise_error "This is not a valid type of Menu Item"
      expect { item_2 = MenuItem.new("Sandwich", 8.25, "String", 10) }.to raise_error "This is not a valid type of Menu Item"
      expect { item_3 = MenuItem.new("Sandwich", 8.25, :alt_symbol, 10) }.to raise_error "This is not a valid type of Menu Item"
      expect { item_4 = MenuItem.new("Sandwich", 8.25, :cabbage, 10) }.to raise_error "This is not a valid type of Menu Item"
    end
    
    it 'Should fail when value passed as type at initialize is not a valid symbol' do
      expect { item_1 = MenuItem.new("Curry Goat", 10.50, :starter, nil) }.to raise_error "This is not a valid input type for stock_count"
      expect { item_2 = MenuItem.new("Sandwich", 8.25, :main_course, 2.4) }.to raise_error "This is not a valid input type for stock_count"
    end
  end
end