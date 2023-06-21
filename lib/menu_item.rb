class MenuItem
  def initialize(dish, price, type, stock_count)
    @item = input_validator(dish, price, type, stock_count)
  end

  # This method has been added just for the sake of testing
  def show_item
    @item
  end

  def dish_name
    @item[:dish]
  end

  def dish_price
    @item[:price]
  end

  def dish_type
    @item[:type]
  end

  def dish_stock
    @item[:stock_count]
  end

  def input_validator(dish, price, type, stock_count)
    @acceptable_types = [:starter, :dessert, :main_course]
    if !(dish.is_a?(String)) || dish.empty?
      fail 'This is not a valid input type for dish.'
    elsif !(price.is_a?(Float)) || price < 0
      fail 'This is not a valid input for price.'
    elsif !(@acceptable_types.any? { |acceptable| acceptable == type })
      fail 'This is not a valid type of Menu Item'
    elsif !(stock_count.is_a?(Integer)) || stock_count < 1
      fail 'This is not a valid input for stock_count'
    else
      return { dish: dish, price: price, type: type, stock_count: stock_count }
    end
  end
end