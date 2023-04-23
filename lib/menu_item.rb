class MenuItem
  def initialize(dish, price, type, stock_count)
    @acceptable_types = [:starter, :dessert, :main_course]
    if !(dish.is_a?(String)) || dish.empty?
      fail "This is not a valid input type for dish."
    elsif !(price.is_a?(Float))
      fail "This is not a valid input type for price."
    elsif !(@acceptable_types.any? { |acceptable| acceptable == type })
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