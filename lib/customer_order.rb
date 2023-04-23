class CustomerOrder
  def initialize
    @selected_items = []
  end

  def select_dish(menu)
    # takes an instance of menu and Adds selected items from this instance to selected items array
    menu.fetch() << @selected_items
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