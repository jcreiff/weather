require './current_conditions.rb'
require './forecast_ten_day.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './hurricanes.rb'


print "Welcome to WeatheReport. Please enter your zipcode: "
input = gets.chomp

if input =~ /\d{5}/
  zip = input
elsif input =~/[a-zA-Z]+,\s[a-zA-Z]{2}\z/
  array = input.split
  array[-2] = array[-2][0..-2]
  array[0..-2] = array[0..-2].map {|w| w.capitalize}
  array[-1] = array[-1].upcase
  city = array[0..-2].join("_")
  state = array[-1]+"/"
  name = state + city
end

#
# current = ConditionsSummary.new(zip)
# ten_day = TenDayForecast.new(zip)
# sun_times = SunriseSunset.new(zip)
# alert = CurrentAlert.new(zip)
# canes = ActiveHurricaneList.new
#
#
# current.display
# puts
# sun_times.display
# puts
# alert.display
# puts
# ten_day.display
# canes.display
# puts
# current.display_update
