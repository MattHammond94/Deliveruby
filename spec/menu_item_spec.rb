require 'menu_item'

describe MenuItem do
  context 'Functionality' do
    it 'Should return a hash of given values' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      expect(item_1.show_item).to eq ({ dish: "Curry Goat", price: 10.00, type: :main_course, stock_count: 10 })
    end

    it 'Should return the dish name when dish_name is called' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      expect(item_1.dish_name).to eq "Curry Goat"
    end
    
    it 'Should return the dish price as a float when dish_price is called' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      expect(item_1.dish_price).to eq 10.00
    end

    it 'Should return the dish type when dish_type is called' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      expect(item_1.dish_type).to eq :main_course
    end

    it 'Should return the dish stock count when dish_stock is called' do
      item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
      expect(item_1.dish_stock).to eq 10
    end
  end

  context 'Should fail' do
    it 'Should fail when a non string value is passed for dish when creating new item' do
      expect { item_1 = MenuItem.new(:symbol, 10.00, :main_course, 10) }.to raise_error "This is not a valid input type for dish."
      expect { item_2 = MenuItem.new(nil, 10.00, :main_course, 10) }.to raise_error  "This is not a valid input type for dish."
      expect { item_2 = MenuItem.new("", 10.00, :main_course, 10) }.to raise_error  "This is not a valid input type for dish."
    end

    it 'Should fail when a non float value for price is passed when creating new item' do
      expect { item_1 = MenuItem.new("Curry Goat", nil, :main_course, 10) }.to raise_error "This is not a valid input for price."
      expect { item_2 = MenuItem.new("Sandwich", 8, :main_course, 10) }.to raise_error "This is not a valid input for price."
      expect { item_3 = MenuItem.new("Sandwich", -1.50, :main_course, 10) }.to raise_error "This is not a valid input for price."
    end

    it 'Should fail when value passed as type at initialize is not a valid symbol' do
      expect { item_1 = MenuItem.new("Curry Goat", 10.50, nil, 10) }.to raise_error "This is not a valid type of Menu Item"
      expect { item_2 = MenuItem.new("Sandwich", 8.25, "String", 10) }.to raise_error "This is not a valid type of Menu Item"
      expect { item_3 = MenuItem.new("Sandwich", 8.25, :alt_symbol, 10) }.to raise_error "This is not a valid type of Menu Item"
      expect { item_4 = MenuItem.new("Sandwich", 8.25, :cabbage, 10) }.to raise_error "This is not a valid type of Menu Item"
    end
    
    it 'Should fail when value passed as stock count at initialize is not a valid Integer or is less than 1' do
      expect { item_1 = MenuItem.new("Curry Goat", 10.50, :starter, nil) }.to raise_error "This is not a valid input for stock_count"
      expect { item_2 = MenuItem.new("Sandwich", 8.25, :main_course, 2.4) }.to raise_error "This is not a valid input for stock_count"
      expect { item_3 = MenuItem.new("Sandwich", 8.25, :main_course, 0) }.to raise_error "This is not a valid input for stock_count"
      expect { item_4 = MenuItem.new("Sandwich", 8.25, :main_course, -3) }.to raise_error "This is not a valid input for stock_count"
    end
  end
end