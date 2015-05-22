require 'httparty'

class ActiveHurricaneList

  attr_reader :page

  def initialize
    @page = get_data
  end

  def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end

  def storm_info
    page["currenthurricane"][0]["stormInfo"]["stormName_Nice"]
  end

  def ref_url
    page["currenthurricane"][0]["stormInfo"]["wuiurl"]
  end

  def display
    if storm_info == nil
      puts "No Hurricanes Currently Active"
    else
      puts "Current Active Hurricanes"
      puts "*" *25
      puts "Hurricane #{storm_info}"
      puts "For more information, visit:"
      puts "#{ref_url}"
    end
  end
end
