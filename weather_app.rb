require './current_conditions.rb'
require './forecast_ten_day.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './hurricanes.rb'


print "Welcome to WeatheReport. Please enter your zipcode: "
zip = gets.chomp

current = ConditionsSummary.new(zip)
ten_day = TenDayForecast.new(zip)
sun_times = SunriseSunset.new(zip)
alert = CurrentAlert.new(zip)
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
