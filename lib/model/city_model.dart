import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends Equatable{
  final String? title;
  @JsonKey(name:"location_type")
  final String? locationType;
  @JsonKey(name: "woeid")
  final int woeId;
  final String? latt_long;


  CityModel({this.title,this.locationType,required this.woeId,this.latt_long});

  factory CityModel.fromJson(Map<String,dynamic> json) => _$CityModelFromJson(json);
  Map<String,dynamic> toJson() => _$CityModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [title,locationType,woeId,latt_long];




}