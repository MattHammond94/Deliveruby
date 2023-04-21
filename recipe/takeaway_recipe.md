## 1. Describe the Problem
> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.

> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System 

_class Menu_ 
* Holds a hash of dishes and their respective price 
* Method view_menu => returns all dishes and their price
* Method add_item => adds a menu item to the menu

_class CustomerOrder_
* Holds an array - @selected_dishes
* Method select_dish adds chosen dishes to order(selected array)
* Method receipt - shows all selected dishes and a grand total of their collective price

_class DeliveryTimeText_
* Monitors current time
* Has a set wait time which can be manually increased based on business
* Sends a text to customer with a order confirmation and wait time (wait time = current_time + current wait time)

```ruby 
class Menu 
  def initialize 
    @menu = [{dish: "Curry Goat", price: 10 }, {dish: "Mash", price: 5}]
  end

  def display_menu
    @menu
  end

  def add_menu_item(Hash)
    Hash << @menu 
  end

  def 
  end
end

class CustomerOrder
  def initialize 
    @selected_items = []
  end

  def select_dish
    @menu.fetch() << @selected_items
  end

  def show_receipt 
    @selected_items 
  end

  private 

  def total_cost
    # Returns the total cost of all selected dishes as an Integer
  end
end

class DeliveryTimeText

For this class will need to look into the Ruby Gem twilio and how it is implemented.
Will probably need to require further 

  def initialize 
  end
end

```