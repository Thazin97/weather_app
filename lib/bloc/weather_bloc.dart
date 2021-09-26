import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/models.dart';
import 'package:weather_app/model/weathers_model.dart';
import 'package:weather_app/network/api_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService api;
  WeatherBloc({required this.api}) : super(EmptyWeatherState());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeatherEvent){
      yield LoadingWeatherState();
      try{
        final response = await api.getWeather(event.cityCode);
        yield LoadedWeatherState(weathersmodel: response);
      }on SocketException {
        yield ErrorWeatherState();
      }on Exception{
        yield ErrorWeatherState();
      }
    }
  }
}
