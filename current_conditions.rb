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
end
