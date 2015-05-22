require 'minitest/autorun'
require 'minitest/pride'
require './current_conditions.rb'
require './forecast_ten_day.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './hurricanes.rb'


class WeatherAppTest<Minitest::Test

  def test_classes_exist
    assert ConditionsSummary.new(24210)
    assert TenDayForecast.new(24210)
    assert SunriseSunset.new(24210)
    assert CurrentAlert.new(24210)
    assert ActiveHurricaneList.new
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
    assert_equal Fixnum, a_town.temperature.class
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

  # SunriseSunset class tests

  def test_sunrise_sunset_returns_times
    time_of = SunriseSunset.new(27514)

    assert_equal 1, time_of.sunrise_hour.length
    assert_equal 2, time_of.sunrise_minute.length
    assert_equal 1, time_of.sunset_hour.length
    assert_equal 2, time_of.sunset_minute.length
  end

  # CurrentAlert class tests

  def test_alert_returns_description
    w_falls = CurrentAlert.new(76301)
    c_hill = CurrentAlert.new(27514)

    assert_includes w_falls.description, "Warning"
    refute c_hill.description
  end

  def test_alert_returns_start_and_stop_times
    w_falls = CurrentAlert.new(76301)

    assert_equal ":", w_falls.start[1]
    assert_equal ":", w_falls.stop[1]
    assert_equal "2015", w_falls.start.split[-1]
    assert_equal "2015", w_falls.stop.split[-1]
  end

  # ActiveHurricaneList class tests

  def test_hurricane_list_returns_storm_name
    list = ActiveHurricaneList.new
    assert_includes list.storm_info, "Invest"
  end

  def test_hurricane_list_returns_ref_url
    list = ActiveHurricaneList.new
    assert_includes list.ref_url, "http://www.wunderground.com/"
  end

end
