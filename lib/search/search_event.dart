part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchCityEvent extends SearchEvent{
  final String cityName;
  FetchCityEvent({required this.cityName});

  @override
  // TODO: implement props
  List<Object?> get props => [cityName];
}
