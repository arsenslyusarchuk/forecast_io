class HomeController < ApplicationController
  def index
    forecast = Forecast::ForecastParser.new(
      longtitude: 37.8267,
      lattitude: -122.423,
      params: { units: 'si', time: Time.now.to_i }
    )
    @results = forecast.get_sunny_weather
  end
end
