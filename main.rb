# Basic Objectives:
# - computer totals lunch items and displays total

# Bonus Objectives:
# - the user can choose as many "add-on" items as they want before getting total
# - the user can clear their choices and start over
# - the user has a wallet total they start with and their choices cannot exceed what they can pay for
# - the program is in a loop to keep asking the user to make new orders until they type 'quit' at any time
# - main dishes and side items have descriptions with them and the user has an option to view the description /nutritional facts before they order (hint: think hashes)
# - descriptions of food can have multiple options like nutritional facts, calories, fat content ect...(hint: think nested hashes)
# - display to the user not only their total but the total fat content/calories / carbs / etc...


require 'pry'
require 'colorize'

@main_dish = [ {dish: 'Burger', cost: 6.00, calories: 700},
              {dish: 'Bratwurst', cost: 4.00, calories: 400},
              {dish: 'Vegan Soy-Bison', cost: 7.00, calories: 700}
]

@side_dish = [ {dish: 'Fries', cost: 2.00, calories: 300},
              {dish: 'Mac n Cheese', cost: 3.00, calories: 350},
              {dish: 'Dressed Baked Potato', cost: 2.50, calories: 400}
]
 
@dessert_dish = [ {dish: 'Cake', cost: 2.00, calories: 300},
            {dish: 'Pudding', cost: 1.00, calories: 350},
            {dish: 'Literally just a bag of sugar', cost: 1.00, calories: 1500}
]

@order=[]

def first_course
  @main_dish.each_with_index do |key, index|
    puts "#{index + 1}) #{key[:dish]}  (#{key[:calories]} cal.) ....... $#{key[:cost]}".colorize(:red)
    end
  input = gets.strip
  case input
  when '1'
    @order.push(@main_dish[0])
  when '2'
    @order.push(@main_dish[1])
  when '3'
    @order.push(@main_dish[2])
  end
end

def side_dish
  @side_dish.each_with_index do |key, index|
    puts "#{index + 1}) #{key[:dish]}  (#{key[:calories]} cal.) ....... $#{key[:cost]}".colorize(:yellow)
  end
  input = gets.strip
  case input
  when '1'
    @order.push(@side_dish[0])
  when '2'
    @order.push(@side_dish[1])
  when '3'
    @order.push(@side_dish[2])
  end
end

def side_loop
  c=0
  loop do
    side_dish
    c +=1
    
    if c == 2
      break
    end
    p 'Tasty! and for your second side?'
  end
end

def to_go
  @order.each_with_index do |key, index|
    puts "#{index + 1}) #{key[:dish]}  (#{key[:calories]} cal.) ....... $#{key[:cost]}".colorize(:yellow)
  end
end

def calories
  total = 0
  @order.values
  binding.pry
end

def cash
end

def main_menu
  p 'Welcome to McCombs!'
  p 'We are currently serving dinner; What would you like?'
  first_course
  p 'Excellent choice! That comes with two sides. Which would you like?'
  side_loop
  puts '-----------------------------------'
  p 'Ok, so you ordered the following:'
  to_go
  puts '-----------------------------------'
  p 'May I suggest taking your order to go?'
  p 'The raccoons have taken the patio and the indoor dining area.'
end


main_menu