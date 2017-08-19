# - the user can clear their choices and start over
# - the user has a wallet total they start with and their choices cannot exceed what they can pay for
# - main dishes and side items have descriptions with them and the user has an option to view the description /nutritional facts before they order (hint: think hashes)
# - descriptions of food can have multiple options like nutritional facts, calories, fat content ect...(hint: think nested hashes)
# - display to the user not only their total but the total fat content/calories / carbs / etc...

require 'pry'
require 'colorize'
require_relative 'main_di_class'
require_relative 'side_di_class'

@order = []
@dishes = []
@price = []
@calories = []

def to_go
  @order.each_with_index do |key, index|
    puts "#{key[:dish]}  (#{key[:calories]} cal.) ....... $#{key[:cost]}".colorize(:light_blue)
  end
end

def cash
  puts "The total calorie count for you meal is #{@calories.inject(:+)} Cal."
  puts "Your grand total today will be $#{@price.inject(:+)}."
  puts 'Would you like to place this order, or start over?'
  puts '1) Place my order'
  puts '2) Forget it, lets start over.'
  resp = gets.to_i
  if resp == 2
    puts 'Not a problem! Lets start over!'
    @order.clear
    @dishes.clear
    @price.clear
    @calories.clear
    main_menu
  end
  exit
end


def main_menu
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
  puts 'Have a great day!'.colorize(:orange)
  @order.clear
  @dishes.clear
  @price.clear
  @calories.clear
  puts 'Would you like to place another order? (Yes/No)'
  resp = gets.strip.downcase
  if resp == 'yes'
    main_menu
  end
  exit
end

def now_serv
  puts 'Welcome to McCombs!'.colorize(:magenta)
  puts 'We are currently serving lunch; What would you like?'
  main_menu
end

now_serv
