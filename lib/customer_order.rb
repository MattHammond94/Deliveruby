class CustomerOrder
  def initialize
    @selected_items = []
  end

  def select_dish(menu, selected_dish)
    menu.show_menu.map { |item| item.dish_name == selected_dish ? @selected_items << item : nil }
  end

  def show_selected_items
    @selected_items
  end

  def show_receipt
    # shows all selected items formatted
    @selected_items
    total_cost.to_s
  end

  private

  def total_cost
    # Returns the total cost of all selected dishes as an Integer
  end
end