# Display a menu in the console for the user to interact with.
# Create a default array of hashes that represent items at a grocery store.
# Create a menu option to add items to a user's grocery cart.
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.
# Zip it up and turn it in!

def greeting
#Welcome greeting when program starts
puts `clear`
design_lines
print "Welcome to the online grocery store"
design_lines
puts
design_lines
print "What would you like to do today?"
design_lines
puts 
menu
end


def menu
  # Menu to show options
  puts 
  design_lines
  print 'Main Menu'
  design_lines
  puts "
  1) view my cart
  2) view store inventory
  3) add items to your cart
  4) remove items from your cart
  5) determine cart total
  6) add new items to the store
  7) exit
  "
  user_choice = gets.strip.to_i
  
  case user_choice
  when 1
    view_cart
  when 2
    store_products
  when 3
    add_to_cart
  when 4 
    remove_from_cart
  when 5 
    calc_cart_total
  when 6
    add_items_to_store
  when 7 
    exit_store
  else 
    puts "Wrong choice, try again"
    menu
  end 
end

def cart_items
  puts `clear`
  puts 
  design_lines
  print "Items in your cart"
  design_lines
  puts
  if @user_cart == []
    puts "There are no items in your cart currently"
    menu
  else
    @user_cart.each_with_index do |product, i|
      
      puts "#{i + 1}) #{product[:item]}: price:#{product[:price]}"
    end
  end
end

def view_cart
  #will display items in cart
  cart_items
  calc_cart_total
  menu
end 

def display_items
  puts `clear`
  puts 
  design_lines
  print "We have this available for purchase"
  design_lines
  puts
  @store_inventory.each_with_index do |product, i|
    
    puts "#{i + 1}) #{product[:item]} price #{product[:price]}"
  end
end

def store_products
  # This will show what the store has in inventory
  display_items
  menu
end

def add_to_cart
  #this will add available items to the cart
  puts `clear`
  puts 
  display_items
  puts 
  print "What item would you like to add to your cart?"
  puts 
  user_choice = gets.strip.to_i
  if user_choice > @store_inventory.length()  
    puts "Wrong choice dummy, try again"
    sleep 1
    add_to_cart
  else
    item_to_add = @store_inventory[user_choice - 1][:item]
    @user_cart << @store_inventory[user_choice - 1]
  end
  puts item_to_add
  
  puts "You have added the #{item_to_add} to your cart"
  puts 
  design_lines
  print "Your cart items are shown below"
  design_lines
  puts
  view_cart
  menu
  
end

def remove_from_cart
  #this will display cart then allow you to remove item
  puts `clear`
  puts 
  cart_items
  print "What item would you like to remove from your cart?"
  puts 
  user_choice = gets.strip.to_i
  if user_choice > @user_cart.length()  
    puts "Wrong choice dummy, try again"
    sleep 1
    remove_from_cart
  else
  item_to_remove = @user_cart[user_choice - 1][:item]
  puts @user_cart[user_choice -1]
  puts "#{item_to_remove} tb removed"
  puts user_choice
  @user_cart.delete_at(user_choice -1)
  puts "You have removed the #{item_to_remove} to your cart"
  end
  view_cart
end

#var outside method so it does not reset to 0 when method is called
def calc_cart_total
  @cart_total = 0
  #This will determine the cart total
  @user_cart.each do |product|
    @cart_total = @cart_total + product[:price]
  end
  puts "Your cart will cost you $#{@cart_total}.00 currently."
end

def add_items_to_store
  #This gives user the option to add new items to the store inventory
  puts `clear`
  puts 
  display_items
  puts 
  print "What item would you like to add to the store?"
  puts 
  new_item_name = gets.strip
  puts "How much should this item be?"
  new_item_price = gets.strip.to_i
  
  new_item = {}
  new_item['item'.to_sym] = new_item_name
  new_item['price'.to_sym] = new_item_price
  
  @store_inventory << new_item
  
  puts "You have added #{new_item_name}, that costs #{new_item_price}."
  
  display_items
  menu
end

def exit_store
  puts `clear`
  design_lines
  print "Thanks for visiting the grocery store today!"
  design_lines
  puts 
  design_lines
  print "Goodbye"
  design_lines
  puts 
  exit
end

def design_lines
  6.times do 
  print "--"
  end 
end

  #store inventory
  @store_inventory = [
  { item: 'apple', price: 2 },
  { item: 'orange', price: 2 },
  { item: 'banana', price: 67 },
  {item: 'twinkies', price: 545},
  {item: 'snickers', price: 4},
  {item: "chicken", price: 8},
  {item: "eggs", price: 3},
  {item: "ice cream", price: 35},
  {item: "coffee", price: 23}
]

@user_cart = []

  greeting

