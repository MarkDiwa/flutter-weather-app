import 'package:flutter_weather_app/modules/forecast/domain/repositories/forecast_repository.dart';
import 'package:flutter_weather_app/modules/forecast/data/models/daily_forecast.dart';

class GetForecastUseCase {
  final ForecastRepository repository;

  GetForecastUseCase(this.repository);

  Future<List<DailyForecast>> execute(
    double lat,
    double lon,
  ) async =>
      await repository.getFiveDayForecast(lat, lon);
}
