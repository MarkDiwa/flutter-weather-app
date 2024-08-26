import 'package:dio/dio.dart';
import 'package:flutter_weather_app/modules/core/data/services/api_client.dart';

class ForecastService {
  final ApiClient apiClient;

  ForecastService(this.apiClient);

  Future<Response> fetchFiveDayForecast(double lat, double lon) async {
    final response = await apiClient.get(
      'forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'units': 'metric',
      },
    );
    return response;
  }
}
