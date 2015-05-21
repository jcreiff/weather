require 'httparty'

class TenDayForecast

  attr_reader :page

  def initialize(zip)
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")
  end

  def day(num)
    page["forecast"]["simpleforecast"]["forecastday"][num]["date"]["weekday_short"]
  end

end
