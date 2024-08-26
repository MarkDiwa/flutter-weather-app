import 'package:flutter_weather_app/modules/forecast/data/models/daily_forecast.dart';
import 'package:flutter_weather_app/modules/forecast/domain/use_cases/get_forecast_use_case.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'forecast_state.dart';

class ForecastCubit extends HydratedCubit<ForecastState> {
  final GetForecastUseCase getForecastUseCase;

  ForecastCubit(this.getForecastUseCase) : super(ForecastInitial());

  Future<void> fetchForecast(double lat, double lon) async {
    try {
      emit(ForecastLoading());
      final forecasts = await getForecastUseCase.execute(lat, lon);
      emit(ForecastLoaded(forecasts));
    } catch (e) {
      emit(ForecastError('Failed to fetch forecast'));
    }
  }

  @override
  ForecastState? fromJson(Map<String, dynamic> json) {
    try {
      final forecasts = (json['forecasts'] as List<dynamic>)
          .map(
            (item) => DailyForecast.fromJson(item),
          )
          .toList();
      return ForecastLoaded(forecasts);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ForecastState state) {
    if (state is ForecastLoaded) {
      final forecastsJson = state.forecasts.map((f) => f.toJson()).toList();
      return {'forecasts': forecastsJson};
    }
    return null;
  }
}
