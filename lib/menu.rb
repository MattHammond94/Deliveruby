class Menu
  def initialize
    @menu = []
  end

  def show_menu
    @menu
  end

  def add_menu_item(menu_item)
    raise 'This is not a valid menu item and cannot be added to the menu' unless menu_item.is_a?(MenuItem)

    @menu << menu_item
  end

  def remove_menu_item(menu_item)
    @menu.delete(menu_item)
  end

  def display_partial_menu(type)
    raise 'This is not a valid menu type' unless type.is_a?(Symbol)
    
    menu_type = @menu.select { |item| item.dish_type == type }
    type == :main_course ? "Main Courses:\n#{formatter(menu_type)}" : "#{type.to_s.capitalize} menu:\n#{formatter(menu_type)}"
  end

  def display_full_menu
    "#{display_partial_menu(:starter)}\n#{display_partial_menu(:main_course)}\n#{display_partial_menu(:dessert)}"
  end

  def formatter(menu)
    menu.map { |item| "#{item.dish_name} - £#{format('%.2f', item.dish_price)}" }.join("\n")
  end
end
