import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';
@JsonSerializable()
class WeatherModel extends Equatable{
   final String? weather_state_name;
   final String? weather_state_abbr;
   final String? created;
   @JsonKey(name: "min_temp")
   final double? min;
   @JsonKey(name: "max_temp")
   final double? max;
   @JsonKey(name: "the_temp")
   final double? temp;

   WeatherModel({this.weather_state_name, this.weather_state_abbr, this.created,
      this.min, this.max, this.temp});

   factory WeatherModel.fromJson(Map<String,dynamic> json) => _$WeatherModelFromJson(json);
   Map<String,dynamic> toJson() => _$WeatherModelToJson(this);


   @override
  // TODO: implement props
  List<Object?> get props => [weather_state_name,weather_state_abbr,created,min,max,temp];
  
  
   
}