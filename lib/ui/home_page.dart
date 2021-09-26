import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/ui/search_city.dart';
import 'package:weather_app/utils/helper.dart';

class HomePage extends StatefulWidget {

  final int cityCode;
     const HomePage({Key? key,   this.cityCode= 1015662} ) : super(key: key) ;



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newFormat = DateFormat("yyyy/dd/MM HH:mm:ss");
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(FetchWeatherEvent(cityCode: widget.cityCode));
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        actions:  [
             IconButton(
                 onPressed:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchCity()));
                   },
                 icon: const Icon(Icons.search),
               tooltip: 'Search City',
             ),
        ],
        title:const Center(child: Text('Weather')),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
        child: BlocBuilder<WeatherBloc,WeatherState>(
          builder: (context,state) {
            if (state is LoadingWeatherState) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is ErrorWeatherState){
              return const Center(child: Text('Error Loading from API'));
            }
            if (state is LoadedWeatherState) {
              return ListView(
                children: [ Column(
                    children:  [
                      Text("${state.weathersmodel.title}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.blueAccent
                      ),),
                      Text("Updated:" + newFormat.format(DateTime.parse('${state.weathersmodel.weathers![0].created}')).toString(),
                        style: TextStyle(color: Colors.blue[900]),),
                      const SizedBox(height:20,),
                      Image(image: AssetImage('images/${Helper.mapStringToImage('${state.weathersmodel.weathers![0].weather_state_abbr}')}.png')),
                      const SizedBox(height: 20,),
                      Text('${state.weathersmodel.weathers![0].weather_state_name}', style:  TextStyle(
                          fontSize: 22,
                          color: Colors.deepPurple[400],
                          fontWeight: FontWeight.w800
                      ),),
                    ]),
                  Container(
                    padding: const EdgeInsets.only(left: 50,right: 50,top: 20,bottom: 20),
                    child: Row(
                      children: [
                         Text('${state.weathersmodel.weathers![0].temp!.toInt()}°C',
                          style:const TextStyle(color: Colors.deepPurpleAccent, fontSize: 27),),
                        const SizedBox(width: 25,),
                        Column(
                          children:  [
                            Text('min: ' '${state.weathersmodel.weathers![0].min!.toInt()}°C',
                              style: TextStyle(color: Colors.blue[400],
                              fontWeight: FontWeight.w700),),
                            Text('max: ' '${state.weathersmodel.weathers![0].max!.toInt()}°C',
                               style: TextStyle(color: Colors.blue[400],
                               fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    ),
                  )

                ],
              );
            }
            return const Center(
              child: Text('null'),
            );
          }
          ),
      )

      );

    }
  }

