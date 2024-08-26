import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/modules/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:flutter_weather_app/modules/forecast/data/models/daily_forecast.dart';

class WeeklyForecastPage extends StatelessWidget {
  const WeeklyForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 4.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(),
          Expanded(
            child: BlocBuilder<ForecastCubit, ForecastState>(
              builder: (context, state) {
                if (state is ForecastLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ForecastLoaded) {
                  final List<DailyForecast> dailyForecasts = state.forecasts;

                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade800, Colors.blue.shade400],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: dailyForecasts.length,
                      itemBuilder: (context, index) {
                        final forecast = dailyForecasts[index];
                        return _DailyForecastItem(forecast: forecast);
                      },
                    ),
                  );
                } else if (state is ForecastError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue.shade900,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, color: Colors.white, size: 32.0),
          SizedBox(width: 8.0),
          Text(
            'This Week Forecast',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyForecastItem extends StatelessWidget {
  final DailyForecast forecast;

  const _DailyForecastItem({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                'https://openweathermap.org/img/wn/${forecast.icon}.png',
                width: 40.0,
                height: 40.0,
              ),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    forecast.description,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    forecast.dateTime.split(' ')[0],
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '${forecast.tempMax.toStringAsFixed(1)}°C',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
