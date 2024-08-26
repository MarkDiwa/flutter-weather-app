import 'package:flutter_weather_app/modules/forecast/data/models/daily_forecast.dart';

abstract class ForecastRepository {
  Future<List<DailyForecast>> getFiveDayForecast(
    double lat,
    double lon,
  );
}
