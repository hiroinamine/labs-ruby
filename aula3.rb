# estruturas de controle
# condicional
print 'What day of the week is today? '
day = gets.chomp

if day == 'Sunday'
    lunch = 'especial'    
elsif day == 'Saturday' 
    lunch = 'delicious'
else
    lunch = 'normal'
end
puts "Lunch is #{lunch} today"
puts "-------"

product_status = 'open'
unless product_status == 'open' # unless = if not
    check_change = 'can'
else
    check_change = 'can not'
end
puts "You #{check_change} change the product"
puts "-------"

print 'Press some number (1-5) '
number = gets.chomp.to_i
case number
when 1..2
    puts 'Number 1-2'
when 3..4
    puts 'Number 3-4'
when 5
    puts 'Number 5'
else
    puts "wrong number"
end
puts "-------"

# iteraçao
fruits = ['maca', 'laranja', 'uva']
for fruit in fruits
    puts fruit
end
puts "-------"

x = 1 
while x <= 5
    puts x
    x += 1
end
puts "-------"

count = 1
loop do
    puts count
    if count == 5  # igual a `break if count == 10`
        break
    end
    count += 1
end
puts "-------"

3.times do
    puts 'hello'
end
puts "-------"

print 'Do you want to clear console?(Y/N) '
clean = gets.chomp
system "clear" if clean == 'Y'