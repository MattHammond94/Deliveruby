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

_class MenuItem_
* creates a new menu item as a hash data type 
* MenuItem instances will hold 

_class MenuItemFormatter_
* Formats menu instances to show as only dish name and price as concatenated strings
* (Can use this class just as a private method within the user/customer class)

_class DeliveryTimeText_
* Monitors current time
* Has a set wait time which can be manually increased based on business
* Sends a text to customer with a order confirmation and wait time (wait time = current_time + current wait time)

```ruby 
class Menu 
  def initialize 
    @menu = [{dish: "Curry Goat", price: 10.00, type: :main_course, :stock_count 10}, 
             {dish: "Mash", price: 3.99, type: :starter, :stock_count 5},
             {dish: "Tiramisu", price: 4.99, type: :dessert, :Stock_count 3},
             {dish: "Big bit of Salmon", price: 12.50, type: :main_course, :stock_count 6}]
  end

  def add_menu_item(MenuItem)
    # takes an instance of menu item as a hash
    # Hash << @menu
  end
  
  def remove_menu_item(MenuItem)
    # Removes item from menu permenantly
  end
end

class MenuItem 
  def initialize(dish, price, type, stock_count)
    dish should be a STRING or returns an error
    price should be a FLOAT or returns an error
    type should be a SYMBOL or string of (:main_course, :dessert or :starter) or returns an error
    stock_count should be a INTEGER or returns an error

    creates a new hash with each key passed respective value as above 
  end
end

# class MenuItemFormatter
#   def format(MenuItem)
#     # Converts instance of menu item into a single concat string of dish name and price
#   end
# end

class Customer
  def initialize 
    @selected_items = []
  end

  def display_full_menu
    # Shows all the menu as a full formatted list
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

  def format
    # Formats each item as specified.
  end

  def total_cost
    # Returns the total cost of all selected dishes as an Integer
  end
end

class DeliveryTimeText
# For this class will need to look into the Ruby Gem twilio and how it is implemented.
# Will probably need to require further 

  def initialize 
  end
end

```

## 3. Create Examples as Integration Tests
``` ruby
item_1 = MenuItem.new("Curry Goat", 10.00, :main_course, 10)
item_2 = MenuItem.new("Mash", price: 3.99, type: :starter, :stock_count 5)
item_3 = MenuItem.new("Tiramisu", price: 4.99, type: :dessert, :Stock_count 3)
item_4 = MenuItem.new( "Big bit of Salmon", 12.50, :main_course, 6)
menu_1 = Menu.new
menu_1.add_menu_item(item_1)
menu_1.add_menu_item(item_2)
menu_1.add_menu_item(item_3)
menu_1.add_menu_item(item_4)
customer_1 = Customer.new

customer_1.display_desserts => "Desserts: Tiramisu - £4.99"
customer_1.display_main_courses => "Main Courses: Big bit of Salmon - £12.50, Curry Goat - £10.00"

customer_1.select_dish(item_1) 
customer_1.select_dish(item_3) => @selected_items => [item_1, item_3]
customer_1.show_receipt => "Curry goat - £10.00, Tiramisu - £4.99, Total cost: £14.99"

customer_1.display_full_menu => "Starters: 
                                 Mash - £5.00
                                 Main Courses:
                                 Big bit of Salmon - £12.50, 
                                 Curry Goat - £10.00
                                 Desserts:
                                 Tiramisu - £4.99"
                            
```

## 4. Create Examples as Unit Tests 
```ruby

# Customer unit tests using doubles:
item_1 = double 
menu_1 = double
menu_1.add_menu_item(item_1)
menu.display_full_menu => item_1


# Menu Item class errors: 

item_1 = MenuItem.new(nil, "string", :dessert, 10) => fail/error
item_2 = MenuItem.new("String", 1.25, :starter, 10.5) => fail/error
item_3 = MenuItem.new("String", 10, "Main Course", 5) => fail/error

# Menu class errors: 

item_1 = double 
menu_1 = Menu.new
menu_1.add_menu_item(RandomObj) => fail/error

```

## 5. Implement the Behaviour 
_After each test you write follow the test-driving process of red, green, refactor to implement the behaviour_