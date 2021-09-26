part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent{
  final int cityCode;
  FetchWeatherEvent({required this.cityCode});

  @override
  // TODO: implement props
  List<Object?> get props => [cityCode];
}
