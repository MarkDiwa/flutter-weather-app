import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'daily_forecast.dart';

part 'serializers.g.dart';

@SerializersFor([
  DailyForecast,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
