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

def main_push
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