import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/model/city_model.dart';
import 'package:weather_app/network/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService api;
  SearchBloc({required this.api}) : super(EmptyCityState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
   if(event is FetchCityEvent){
     yield CityLoadingState();
    try{
      final response = await api.getCities(event.cityName);
      yield CityLoadedState(cityModels: response);
    }on SocketException catch (e){
      yield CityErrorState(error:e.toString() );
    }on Exception catch (e){
      yield CityErrorState(error:e.toString() );
    }
   }
  }
}
