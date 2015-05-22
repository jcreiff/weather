require './current_conditions.rb'
require './forecast_ten_day.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './hurricanes.rb'


print "Welcome to WeatheReport. Please enter your zipcode: "
zip = gets.chomp

current = ConditionsSummary.new(zip)

puts current.display
