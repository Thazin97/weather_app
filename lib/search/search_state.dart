part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class EmptyCityState extends SearchState {

}
class CityLoadingState extends SearchState{

}
class CityLoadedState extends SearchState{
  final List<CityModel> cityModels;
  const CityLoadedState({required this.cityModels});
  @override
  List<Object> get props => [cityModels];
}

class CityErrorState extends SearchState{
  final String error;
  CityErrorState({
    required this.error
});
}
