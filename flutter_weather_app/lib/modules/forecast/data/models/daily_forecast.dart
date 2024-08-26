import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_weather_app/modules/forecast/data/models/serializers.dart';

part 'daily_forecast.g.dart';

abstract class DailyForecast implements Built<DailyForecast, DailyForecastBuilder> {
  String get dateTime;
  double get tempMin;
  double get tempMax;
  String get description;
  String get icon;
  double get temp;
  double get feelsLike;
  int get humidity;

  DailyForecast._();
  factory DailyForecast([void Function(DailyForecastBuilder) updates]) = _$DailyForecast;

  static Serializer<DailyForecast> get serializer => _$dailyForecastSerializer;

  static DailyForecast fromJson(Map<String, dynamic> json) {
    return DailyForecast((b) => b
      ..dateTime = json['dt_txt'] as String
      ..tempMin = (json['main']['temp_min'] as num).toDouble()
      ..tempMax = (json['main']['temp_max'] as num).toDouble()
      ..description = json['weather'][0]['description'] as String
      ..icon = json['weather'][0]['icon'] as String
      ..temp = (json['main']['temp'] as num).toDouble()
      ..feelsLike = (json['main']['feels_like'] as num).toDouble()
      ..humidity = (json['main']['humidity'] as num).toInt());
  }

  Map<String, dynamic> toJson() => serializers.serializeWith(DailyForecast.serializer, this) as Map<String, dynamic>;
}
