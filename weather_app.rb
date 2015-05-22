require './current_conditions.rb'
require './forecast_ten_day.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './hurricanes.rb'

print "Welcome to WeatheReport! "
location = nil
while location == nil
  print "Please enter your location (ex: '27514' or 'Chapel Hill, NC'): "
  input = gets.chomp

  if input =~ /\A\d{5}\z/
    location = input
  elsif input =~ /[a-zA-Z]+,\s[a-zA-Z]{2}\z/
    array = input.split
    array[-2] = array[-2][0..-2]
    array[0..-2] = array[0..-2].map {|w| w.capitalize}
    array[-1] = array[-1].upcase
    city = array[0..-2].join("_")
    state = array[-1]+"/"
    location = state + city
  else
    print "Your input was not recognized. Try again. "
  end

end

current = ConditionsSummary.new(location)
ten_day = TenDayForecast.new(location)
sun_times = SunriseSunset.new(location)
alert = CurrentAlert.new(location)
canes = ActiveHurricaneList.new


current.display
puts
sun_times.display
puts
alert.display
puts
ten_day.display
canes.display
puts
current.display_update
puts
