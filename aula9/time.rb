# Time
time = Time.now
puts time, time.class, time.year, time.strftime('%d/%m/%y')
time.monday?
puts '-' * 5

time2 = Time.now
puts time == time2
