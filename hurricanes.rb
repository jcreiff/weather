require 'httparty'

class ActiveHurricaneList

  attr_reader :page

  def initialize
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end

  def storm_info
    page["currenthurricane"][0]["stormInfo"]["stormName_Nice"]
  end

  def ref_url
    page["currenthurricane"][0]["stormInfo"]["wuiurl"]
  end
end
