// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weathers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeathersModel _$WeathersModelFromJson(Map<String, dynamic> json) =>
    WeathersModel(
      title: json['title'] as String?,
      location_type: json['location_type'] as String?,
      weathers: (json['consolidated_weather'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      woeId: json['woeid'] as int?,
    );

Map<String, dynamic> _$WeathersModelToJson(WeathersModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': instance.location_type,
      'woeid': instance.woeId,
      'consolidated_weather': instance.weathers,
    };
