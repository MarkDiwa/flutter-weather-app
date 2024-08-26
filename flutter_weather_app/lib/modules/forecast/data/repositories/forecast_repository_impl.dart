import 'package:flutter_weather_app/modules/forecast/data/models/daily_forecast.dart';
import 'package:flutter_weather_app/modules/forecast/data/models/forecast.dart';
import 'package:flutter_weather_app/modules/forecast/data/services/forecast_service.dart';
import 'package:flutter_weather_app/modules/forecast/domain/repositories/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastService forecastService;

  ForecastRepositoryImpl(this.forecastService);

  @override
  Future<List<DailyForecast>> getFiveDayForecast(
    double lat,
    double lon,
  ) async {
    try {
      final response = await forecastService.fetchFiveDayForecast(lat, lon);
      final List<Forecast> forecasts = (response.data['list'] as List).map((json) => Forecast.fromJson(json)).toList();

      final Map<String, List<Forecast>> groupedForecasts = {};

      for (var forecast in forecasts) {
        final date = forecast.dateTime.split(' ')[0]; // Extract just the date

        if (groupedForecasts[date] == null) {
          groupedForecasts[date] = [];
        }

        groupedForecasts[date]!.add(forecast);
      }

      final List<DailyForecast> dailyForecasts = groupedForecasts.entries.map((entry) {
        final forecastsForTheDay = entry.value;

        final String dateTime = entry.key; // Use the date as dateTime
        final double minTemp = forecastsForTheDay.map((f) => f.tempMin).reduce((a, b) => a < b ? a : b);
        final double maxTemp = forecastsForTheDay.map((f) => f.tempMax).reduce((a, b) => a > b ? a : b);

        // Calculate the average temp, feelsLike, and humidity
        final double temp = (minTemp + maxTemp) / 2;
        final double feelsLike =
            (forecastsForTheDay.map((f) => f.tempMin).reduce((a, b) => a + b) / forecastsForTheDay.length);
        final int humidity =
            (forecastsForTheDay.map((f) => f.tempMax).reduce((a, b) => a + b) / forecastsForTheDay.length).round();

        final String description = forecastsForTheDay[0].description;
        final String icon = forecastsForTheDay[0].icon;

        return DailyForecast((b) => b
          ..dateTime = dateTime
          ..tempMin = minTemp
          ..tempMax = maxTemp
          ..temp = temp
          ..feelsLike = feelsLike
          ..humidity = humidity
          ..description = description
          ..icon = icon);
      }).toList();

      return dailyForecasts;
    } catch (e) {
      rethrow;
    }
  }
}
