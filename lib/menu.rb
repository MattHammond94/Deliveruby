class Menu 
  def initialize 
    @menu = []
  end

  def show_menu
    @menu
  end

  def add_menu_item(menu_item)
    fail "This is not a valid menu item and cannot be added to the menu" unless menu_item.is_a?(MenuItem)
    @menu << menu_item
  end
  
  def remove_menu_item(menu_item)
    @menu.delete(menu_item)
    # further logic will be added here at a later date. 
    # May want to add a further method (show_menu_with_index) to allow user the delete using a integer from a list.
    # This will allow user to see the menu formatted in full and to delete using an integer once the menu gets quite large
  end

  def display_full_menu
    format
  end

  def display_starters
    # Will only show :starter type dishes as a formatted list
  end
  
  def display_main_courses
    #  Will only show :main type dishes as a formatted list
  end

  def display_desserts
    # Will only show :dessert type dishes as a formatted list
  end

  private 

  def format
    @menu.map { |item| item.dish_name + " - £#{item.dish_price.to_s}" }
  end
end