import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/modules/forecast/data/models/daily_forecast.dart';
import 'package:flutter_weather_app/modules/forecast/presentation/pages/weekly_forecast_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_weather_app/modules/forecast/presentation/cubit/forecast_cubit.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  void initState() {
    super.initState();
    _fetchLocationAndForecast(context);
  }

  Future<void> _fetchLocationAndForecast(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location services are disabled.'),
        ),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (context.mounted && permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location permission is denied.'),
          ),
        );
        return;
      }
    }
    Position position = await Geolocator.getCurrentPosition(locationSettings: const LocationSettings());

    if (context.mounted) {
      final cubit = context.read<ForecastCubit>();
      cubit.fetchForecast(position.latitude, position.longitude);
    }
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ForecastCubit, ForecastState>(
        builder: (context, state) {
          if (state is ForecastLoaded) {
            final forecast = state.forecasts.first;
            final greeting = _getGreeting();

            return _WeatherContent(greeting: greeting, forecast: forecast);
          }

          if (state is ForecastLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ForecastError) return Center(child: Text(state.message));

          return Container();
        },
      ),
    );
  }
}

class _WeatherContent extends StatelessWidget {
  const _WeatherContent({
    required this.greeting,
    required this.forecast,
  });

  final String greeting;
  final DailyForecast forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade300],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _GreetingText(greeting: greeting),
            const SizedBox(height: 20.0),
            _WeatherInfo(forecast: forecast),
            const SizedBox(height: 40.0),
            _ForecastButton(),
            const SizedBox(height: 20.0),
            _TemperatureInfo(forecast: forecast),
            const SizedBox(height: 20.0),
            _HumidityInfo(forecast: forecast),
          ],
        ),
      ),
    );
  }
}

class _GreetingText extends StatelessWidget {
  final String greeting;

  const _GreetingText({required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Text(
      greeting,
      style: const TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  final DailyForecast forecast;

  const _WeatherInfo({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network(
            'https://openweathermap.org/img/wn/${forecast.icon}@4x.png',
            width: 100.0,
            height: 100.0,
          ),
          Text(
            '${forecast.tempMax.toStringAsFixed(1)}°C',
            style: const TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            forecast.description,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white70,
            ),
          ),
          Text(
            forecast.dateTime,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _ForecastButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WeeklyForecastPage(),
          ),
        );
      },
      child: const Text('This Week Forecast'),
    );
  }
}

class _TemperatureInfo extends StatelessWidget {
  final DailyForecast forecast;

  const _TemperatureInfo({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _TemperatureDetail(label: 'Min Temp:', value: '${forecast.tempMin.toStringAsFixed(1)}°C'),
        _TemperatureDetail(label: 'Feels Like:', value: '${forecast.feelsLike.toStringAsFixed(1)}°C'),
      ],
    );
  }
}

class _TemperatureDetail extends StatelessWidget {
  final String label;
  final String value;

  const _TemperatureDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class _HumidityInfo extends StatelessWidget {
  final DailyForecast forecast;

  const _HumidityInfo({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _HumidityDetail(label: 'Humidity:', value: '${forecast.humidity}%'),
        _TemperatureDetail(label: 'Max Temp:', value: '${forecast.tempMax.toStringAsFixed(1)}°C'),
      ],
    );
  }
}

class _HumidityDetail extends StatelessWidget {
  final String label;
  final String value;

  const _HumidityDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
