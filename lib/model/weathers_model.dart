import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/models.dart';
part 'weathers_model.g.dart';
@JsonSerializable()
class WeathersModel extends Equatable{
  final String? title;
  final String? location_type;
  @JsonKey(name: "woeid")
  final int? woeId;
  @JsonKey(name: "consolidated_weather")
  final List<WeatherModel>? weathers;


  WeathersModel({this.title, this.location_type,required this.weathers,this.woeId});

  factory WeathersModel.fromJson(Map<String,dynamic> json) => _$WeathersModelFromJson(json);
  Map<String,dynamic> toJson() => _$WeathersModelToJson(this);


  @override
  // TODO: implement props
  List<Object?> get props => [title,location_type,woeId,weathers];
}