require 'minitest/autorun'
require 'minitest/pride'
require './weather_app.rb'

class WeatherAppTest<Minitest::Test

  def test_classes_exist
    assert ConditionsSummary.new(24210)
    assert TenDayForecast.new(24210)
    assert SunriseSunset.new(24210)
    assert CurrentAlert.new(24210)
    assert ActiveHurricaneList.new(24210)
  end

end
