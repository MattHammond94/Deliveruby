class MenuItem
  def initialize(dish, price, type, stock_count)
    if !(dish.is_a?(String))
      fail "This is not a valid input type for dish."
    elsif !(price.is_a?(Float))
      fail "This is not a valid input type for price."
    elsif !(type.is_a?(Symbol))
      fail "This is not a valid type of Menu Item"
    elsif !(stock_count.is_a?(Integer))
      fail "This is not a valid input type for stock_count"
    else
      @item = { dish: dish, price: price, type: type, stock_count: stock_count }
    end
  end

  # This method has been added just for the sake of testing
  def show_item
    @item
  end
end