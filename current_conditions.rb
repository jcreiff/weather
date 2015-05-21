require 'httparty'

class ConditionsSummary
  attr_reader :page

  def initialize(zip)
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def location
    page["current_observation"]["display_location"]["full"]
  end

  def last_update
    page["current_observation"]["observation_time"]
  end

  def temperature
    page["current_observation"]["temp_f"]
  end

  def weather
    page["current_observation"]["weather"]
  end

  def humidity
    page["current_observation"]["relative_humidity"]
  end

  def wind
    page["current_observation"]["wind_string"]
  end

end
