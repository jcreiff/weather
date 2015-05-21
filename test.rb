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

  # ConditionsSummary class tests

  def test_conditions_summary_knows_location
    a_town = ConditionsSummary.new(24210)
    assert_equal "Abingdon, VA", a_town.location
  end

  def test_conditions_summary_knows_last_update
    a_town = ConditionsSummary.new(24210)
    assert_includes a_town.last_update, "Last Updated on"
  end

  def test_conditions_summary_knows_conditions
    a_town = ConditionsSummary.new(24210)
    assert_equal Float, a_town.temperature.class
    refute_empty a_town.weather
    assert_equal "%", a_town.humidity[-1]
    assert_includes a_town.wind, "MPH"
  end

  # TenDayForecast class tests

  def test_ten_day_returns_weekday_abbreviations
    forecast = TenDayForecast.new(30322)
    today = forecast.day(0)
    assert_equal 3, today.length
  end

  def test_ten_day_returns_high_and_low
    forecast = TenDayForecast.new(30322)
    high_today = forecast.high(0)
    low_today = forecast.low(0)

    assert_equal 2, high_today.length
    assert_equal 2, low_today.length
    assert high_today.to_i > 0
    assert low_today.to_i < 100
  end

  def test_ten_day_returns_conditions
    forecast = TenDayForecast.new(30322)
    refute_empty forecast.conditions(0)
  end

end
