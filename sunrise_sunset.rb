require 'httparty'

class SunriseSunset

  attr_reader :page

  def initialize(zip)
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip}.json")
  end

  def sunrise_hour
    page["sun_phase"]["sunrise"]["hour"]
  end

  def sunrise_minute
    page["sun_phase"]["sunrise"]["minute"]
  end

  def sunset_hour
    military = page["sun_phase"]["sunset"]["hour"].to_i
    (military - 12).to_s
  end

  def sunset_minute
    page["sun_phase"]["sunset"]["minute"]
  end

  def display
    puts "Sunrise: #{sunrise_hour}:#{sunrise_minute} AM"
    puts "Sunset: #{sunset_hour}:#{sunset_minute} PM"
    puts
  end

end
