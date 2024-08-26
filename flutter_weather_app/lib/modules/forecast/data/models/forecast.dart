import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forecast.g.dart';

abstract class Forecast implements Built<Forecast, ForecastBuilder> {
  String get dateTime;
  double get tempMin;
  double get tempMax;
  String get description;
  String get icon;

  Forecast._();
  factory Forecast([void Function(ForecastBuilder) updates]) = _$Forecast;

  static Serializer<Forecast> get serializer => _$forecastSerializer;

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast((b) => b
      ..dateTime = json['dt_txt']
      ..tempMin = (json['main']['temp_min'] as num).toDouble()
      ..tempMax = (json['main']['temp_max'] as num).toDouble()
      ..description = json['weather'][0]['description']
      ..icon = json['weather'][0]['icon']);
  }
}
