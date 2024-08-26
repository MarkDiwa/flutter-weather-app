import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/modules/core/data/services/api_client.dart';
import 'package:flutter_weather_app/modules/core/data/services/env.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_weather_app/modules/forecast/presentation/cubit/forecast_cubit.dart';
import 'package:flutter_weather_app/modules/forecast/domain/use_cases/get_forecast_use_case.dart';
import 'package:flutter_weather_app/modules/forecast/data/repositories/forecast_repository_impl.dart';
import 'package:flutter_weather_app/modules/forecast/data/services/forecast_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_weather_app/modules/forecast/presentation/pages/forecast_page.dart'; // Import the ForecastPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // Initialize the ForecastService and Repository
  final forecastService = ForecastService(ApiClient(
    baseUrl: Env.baseUrl,
    apiKey: Env.apiKey,
  ));
  final forecastRepository = ForecastRepositoryImpl(forecastService);
  final getForecastUseCase = GetForecastUseCase(forecastRepository);

  HydratedBloc.storage = storage;

  runApp(MyApp(getForecastUseCase: getForecastUseCase));
}

class MyApp extends StatelessWidget {
  final GetForecastUseCase getForecastUseCase;

  const MyApp({super.key, required this.getForecastUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ForecastCubit(getForecastUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'Forecast App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ForecastPage(), // Use the imported ForecastPage
      ),
    );
  }
}
