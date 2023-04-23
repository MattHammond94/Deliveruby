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
    "Receipt:\n" + format(@selected_items) + "\nTotal cost: £#{total_cost.to_s}"
  end

  # private

  def format(menu)
    menu.map { |item| item.dish_name + " - £#{item.dish_price.to_s}" }.join("\n")
  end

  def total_cost
    @selected_items.map { |item| item.dish_price }.sum
  end
end