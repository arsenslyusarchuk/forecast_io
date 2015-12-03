require 'forecast_io'

module Forecast
  class ForecastParser
    attr_reader :longtitude, :lattitude, :params

    def initialize(options={})
      @longtitude = options[:longtitude]
      @lattitude  = options[:lattitude]
      @params     = options[:params]
      #some code there
    end

    def get_sunny_weather
      _get_forecast.select { |data| data if data['precipProbability'].zero? }
    end

    private

      def _get_forecast
        Rails.cache.fetch("forecast_cache_key", expires_in: 2.minutes) do
          ForecastIO.forecast(longtitude, lattitude, params: params).daily.data
        end
      end
  end
end
