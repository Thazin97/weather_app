// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      weather_state_name: json['weather_state_name'] as String?,
      weather_state_abbr: json['weather_state_abbr'] as String?,
      created: json['created'] as String?,
      min: (json['min_temp'] as num?)?.toDouble(),
      max: (json['max_temp'] as num?)?.toDouble(),
      temp: (json['the_temp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weather_state_name,
      'weather_state_abbr': instance.weather_state_abbr,
      'created': instance.created,
      'min_temp': instance.min,
      'max_temp': instance.max,
      'the_temp': instance.temp,
    };
