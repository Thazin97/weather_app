import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/search/search_bloc.dart';
import 'package:weather_app/ui/home_page.dart';
class SearchCity extends StatefulWidget {
  const SearchCity({Key? key}) : super(key: key);

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Search Weather') ,
      ) ,
      body: Container(
        padding:const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      validator: (str){
                        if(str!.isEmpty){
                          return 'Please enter City Name';
                        }
                      },
                      controller: _searchController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: 'Search City',
                        hintText: 'Enter City',
                        border: OutlineInputBorder(
                        )
                      ),
                    ),
                  ),
                ),
                 IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.blue,
                  iconSize: 35,
                  onPressed: () {
                    setState(() {
                      if(_formkey.currentState!.validate()){
                        BlocProvider.of<SearchBloc>(context).add(FetchCityEvent(cityName:_searchController.text));
                      }
                    });
                  }
                )
              ],
            ),
             Expanded(
             child: BlocBuilder<SearchBloc,SearchState>(
                 builder: (context,state){
                   if(state is EmptyCityState){
                     return const Center(
                       child: Text('Type Something to search'),
                     );
                   }
                   if(state is CityLoadingState){
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                   if(state is CityErrorState){
                     return Center(child: Text(state.error),);
                   }
                   if(state is CityLoadedState){
                      return ListView.builder(
                        itemCount:state.cityModels.length,
                          itemBuilder: (BuildContext context, int index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>
                                      HomePage(cityCode: state.cityModels[index].woeId)
                              )
                              );

                            },
                            child:Card(
                                  child:Container(
                                    padding:const EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 15),
                                    child:  Text(
                                      '${state.cityModels[index].title}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ) ,
                                )
                          );

                          });
                   }
                   return const Center(
                     child: Text('Null'),
                   );
                 })
             )],

        ),
      ),
    );
  }
}
