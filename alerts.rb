require 'httparty'

class CurrentAlert

  attr_reader :page

  def initialize(zip)
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

  def description
    warning = page["alerts"][0]
    return if warning == nil
    warning["description"]
  end

  def start
    page["alerts"][0]["date"]
  end

  def stop
    page["alerts"][0]["expires"]
  end

end
