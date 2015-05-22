require 'httparty'

class ConditionsSummary
  attr_reader :page

  def initialize(location)
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{location}.json")
  end

  def place
    page["current_observation"]["display_location"]["full"]
  end

  def last_update
    page["current_observation"]["observation_time"]
  end

  def temperature
    page["current_observation"]["temp_f"].to_i
  end

  def weather
    page["current_observation"]["weather"]
  end

  def humidity
    page["current_observation"]["relative_humidity"]
  end

  def wind
    string = page["current_observation"]["wind_string"]
    string[0] = string[0].downcase
    string
  end

  def display
    puts
    puts "Current Conditions for #{place}:"
    puts "*" * (24 + place.length)
    puts "#{weather}"
    puts "Current temperature is #{temperature}°F - Humidity #{humidity}"
    puts "Wind #{wind}"
  end

  def display_update
    puts "[#{last_update}]"
  end

end
