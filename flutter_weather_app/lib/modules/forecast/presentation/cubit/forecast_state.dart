part of 'forecast_cubit.dart';

abstract class ForecastState extends Equatable {
  @override
  List<Object> get props => [];
}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final List<DailyForecast> forecasts;

  ForecastLoaded(this.forecasts);

  @override
  List<Object> get props => [forecasts];
}

class ForecastError extends ForecastState {
  final String message;

  ForecastError(this.message);

  @override
  List<Object> get props => [message];
}
