part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class EmptyWeatherState extends WeatherState {

}
class LoadingWeatherState extends WeatherState{}

class LoadedWeatherState extends WeatherState{
  final WeathersModel weathersmodel;
  LoadedWeatherState({required this.weathersmodel});

  @override
  List<Object> get props => [weathersmodel];
}

class ErrorWeatherState extends WeatherState{

}
