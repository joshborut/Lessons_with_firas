import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/weather_data/presentation/bloc/weather_data_bloc.dart';
import 'features/weather_data/repositories/weather_data_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherDataRepository(),
      child: BlocProvider(
        create: (context) => WeatherDataBloc(),
        child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData.dark(useMaterial3: true),
          home: SizedBox.shrink(),
        ),
      ),
    );
  }
}
