def side_push
  @dishes.push(@order[0][:dish])
  @price.push(@order[0][:cost])
  @calories.push(@order[0][:calories])
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
    @calories.push(@side_dish[1][:calories])
  when '3'
    @order.push(@side_dish[2])
    @dishes.push(@side_dish[2][:dish])
    @price.push(@side_dish[2][:cost])
    @calories.push(@side_dish[2][:calories])
  end
end

def side_loop
  @c=0
  side_dish_loop
end

def side_dish_loop
  loop do
    side_dish
    @c +=1
    if @c == 2
      puts 'Would you like to order additional sides?'
      puts '1) Yes'
      puts '2) No'
      ans = gets.to_i
      case ans
        when 1
          @c -= 1
          side_dish_loop
        when 2
          break
        else 
          p 'Please make a valid selection'
          side_dish_loop
      end
      break
    end
  end
end