import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_data_event.dart';
part 'weather_data_state.dart';

class WeatherDataBloc extends Bloc<WeatherDataEvent, WeatherDataState> {
  WeatherDataBloc() : super(WeatherDataInitial()) {
    on<WeatherDataEvent>(_getCurrentWeather);
  }

  void _getCurrentWeather(event, emit) async {}
}
