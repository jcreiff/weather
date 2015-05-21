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

  def test_conditions_summary_knows_location
    a_town = ConditionsSummary.new(24210)
    assert_equal "Abingdon, VA", a_town.location
  end
end
