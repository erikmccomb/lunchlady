# Basic Objectives:

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

@main_dish = [ {dish: 'Burger', cost: 5.99, calories: 700},
              {dish: 'Bratwurst', cost: 3.99, calories: 400},
              {dish: 'Vegan Soy-Bison', cost: 7.25, calories: 650}
]

@side_dish = [ {dish: 'Fries', cost: 2.25, calories: 300},
              {dish: 'Mac n Cheese', cost: 2.50, calories: 250},
              {dish: 'Dressed Baked Potato', cost: 3.35, calories: 400}
]
 
@dessert_dish = [ {dish: 'Brownie', cost: 2.50, calories: 250},
            {dish: 'Vanilla Shake', cost: 3.00, calories: 400},
            {dish: 'Literally a bag of sugar', cost: 1.00, calories: 1500}
]

@order = []
@dishes = []
@price = []
@calories = []

def main_push
  @dishes.push(@order[0][:dish])
  @price.push(@order[0][:cost])
  @calories.push(@order[0][:calories])
end

def side_push
  @dishes.push(@order[0][:dish])
  @price.push(@order[0][:cost])
  @calories.push(@order[0][:calories])
end

def first_course
  @main_dish.each_with_index do |key, index|
    puts "#{index + 1}) #{key[:dish]}  (#{key[:calories]} cal.) ....... $#{key[:cost]}".colorize(:red)
    end
  input = gets.strip
  case input
  when '1'
    @order.push(@main_dish[0])
    main_push
  when '2'
    @order.push(@main_dish[1])
    main_push
  when '3'
    @order.push(@main_dish[2])
    main_push
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
    @dishes.push(@side_dish[0][:dish])
    @price.push(@side_dish[0][:cost])
    @calories.push(@side_dish[0][:calories])
  when '2'
    @order.push(@side_dish[1])
    @dishes.push(@side_dish[1][:dish])
    @price.push(@side_dish[1][:cost])
    @calories.push(@order[1][:calories])
  when '3'
    @order.push(@side_dish[2])
    @dishes.push(@side_dish[2][:dish])
    @price.push(@side_dish[2][:cost])
    @calories.push(@side_dish[2][:calories])
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
    puts 'Tasty! and for your second side?'
    puts ''
  end
end

def to_go
  @order.each_with_index do |key, index|
    puts "#{index + 1}) #{key[:dish]}  (#{key[:calories]} cal.) ....... $#{key[:cost]}".colorize(:light_blue)
  end
end


# def calories
#   # count calories of items ordered
# end

def cash
  puts "The total calorie count for you meal is #{@calories.inject(:+)} Cal."
  puts "Your grand total today will be $#{@price.inject(:+)}."
end


def main_menu
  puts 'Welcome to McCombs!'
  puts 'We are currently serving lunch; What would you like?'
  first_course
  puts ''
  puts 'Excellent choice! That comes with two sides. Which would you like?'
  side_loop
  puts ''
  puts '-----------------------------------'
  puts 'Ok, so you ordered the following:'
  to_go
  puts '-----------------------------------'
  cash
  puts 'May I suggest taking your order to go?'
  puts 'The raccoons are rather aggressive.'
end


main_menu