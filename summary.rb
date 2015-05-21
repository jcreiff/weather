require 'httparty'

class Summary
  def initialize(zip)
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def temperature
    summary["current_conditions"]["observation_conditions"]["temp_f"]
  end
end
