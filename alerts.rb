require 'httparty'

class CurrentAlert

  attr_reader :page

  def initialize(location)
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{location}.json")
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

  def display
    if description == nil
      puts "No Local Weather Alerts."
    else
      puts "LOCAL WEATHER ALERTS"
      puts "*" * 20
      puts "#{description}"
      puts "From #{start}"
      puts "Until #{stop}"
    end
  end
end
