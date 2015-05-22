require 'minitest/autorun'
require 'minitest/pride'
require './current_conditions.rb'
require './forecast_ten_day.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './hurricanes.rb'
require 'json'

class ConditionsSummary
  def get_data
    JSON.parse(File.open("conditions.json").read)
  end
end

class TenDayForecast
  def get_data
    JSON.parse(File.open("ten_day.json").read)
  end
end

class SunriseSunset
  def get_data
    JSON.parse(File.open("astro.json").read)
  end
end

class CurrentAlert
  def get_data
    JSON.parse(File.open("alert_yes.json").read)
  end
end

class ActiveHurricaneList
  def get_data
    JSON.parse(File.open("canes.json").read)
  end
end

class WeatherAppTest<Minitest::Test

  def test_classes_exist
    assert ConditionsSummary.new(24210)
    assert TenDayForecast.new(24210)
    assert SunriseSunset.new(24210)
    assert CurrentAlert.new(24210)
    assert ActiveHurricaneList.new
  end

  # ConditionsSummary class tests

  def test_conditions_summary_knows_place
    sf = ConditionsSummary.new(94101)
    assert_equal "San Francisco, CA", sf.place
  end

  def test_conditions_summary_knows_last_update
    sf = ConditionsSummary.new(94101)
    assert_equal "Last Updated on May 22, 1:29 PM PDT", sf.last_update
  end

  def test_conditions_summary_knows_conditions
    sf = ConditionsSummary.new(94101)
    assert_equal 62, sf.temperature
    assert_equal "Overcast", sf.weather
    assert_equal "79%", sf.humidity
    assert_equal "from the WSW at 4.0 MPH Gusting to 12.0 MPH", sf.wind
  end

  # TenDayForecast class tests

  def test_ten_day_returns_weekday_abbreviations
    forecast = TenDayForecast.new(94101)
    today = forecast.day(0)
    assert_equal "Fri", today
  end

  def test_ten_day_returns_high_and_low
    forecast = TenDayForecast.new(94101)
    high_today = forecast.high(0)
    low_today = forecast.low(0)

    assert_equal "61", high_today
    assert_equal "53", low_today
  end

  def test_ten_day_returns_conditions
    forecast = TenDayForecast.new(94101)
    assert_equal "Partly Cloudy", forecast.conditions(0)
  end

  # SunriseSunset class tests

  def test_sunrise_sunset_returns_times
    time_of = SunriseSunset.new(94101)

    assert_equal "6", time_of.sunrise_hour
    assert_equal "45", time_of.sunrise_minute
    assert_equal "4", time_of.sunset_hour
    assert_equal "58", time_of.sunset_minute
  end

  # CurrentAlert class tests

  def test_alert_returns_description
    w_falls = CurrentAlert.new(76301)
    assert_equal "Flood Warning", w_falls.description
  end

  def test_alert_returns_start_and_stop_times
    w_falls = CurrentAlert.new(76301)

    assert_equal "3:10 PM CDT on May 22, 2015", w_falls.start
    assert_equal "7:00 AM CDT on May 26, 2015", w_falls.stop
  end

  # ActiveHurricaneList class tests

  def test_hurricane_list_returns_storm_name
    list = ActiveHurricaneList.new
    assert_equal "Invest 90E", list.storm_info
  end


  def test_hurricane_list_returns_ref_url
    list = ActiveHurricaneList.new
    assert_equal "http://www.wunderground.com/hurricane/eastern-pacific/2015/Invest-90E", list.ref_url
  end

end
