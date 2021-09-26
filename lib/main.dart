import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/network/api_service.dart';
import 'package:weather_app/search/search_bloc.dart';
import 'package:weather_app/ui/home_page.dart';
import 'package:weather_app/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
        create: (context) => ApiService.create(),
       child:  Consumer<ApiService>(
       builder: (context,apiService, child){
         return MultiBlocProvider(
         providers: [
           BlocProvider<WeatherBloc>(
            create: (context)=> WeatherBloc(api: apiService)),
           BlocProvider<SearchBloc>(
               create: (context)=> SearchBloc(api: apiService))
         ],
         child: MaterialApp(
            title: 'Weather bloc',
            theme: ThemeData(
            primarySwatch: Colors.deepPurple
    ),
          home:  const HomePage(),
    ));
    },)
    );

  }
}

