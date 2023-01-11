import 'package:flutter/material.dart';
import 'package:moviee/ui/colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:moviee/ui/search_detail.dart';

import '../model/genre_model.dart';
import '../service/search.dart';

final _typeAheadController = TextEditingController();

class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SearchMovies(),
    );
  }
}

class SearchMovies extends StatefulWidget {

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {

  void clear(){
    _typeAheadController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Search", style: TextStyle(fontSize: 30, color: Colors.white),),
          SizedBox(height: 8,),
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _typeAheadController,
              autofocus: true,
              style: TextStyle(color: textColor, fontSize: 28),
              decoration: InputDecoration.collapsed(
                hintText: "Movie,Actors, Directors...",
                hintStyle: TextStyle(color: textColor,fontSize: 24),
              ),
            ),
            suggestionsCallback: (pattern) async {
              return await BackendService.getSuggestions(pattern);
            },
            itemBuilder: (context, suggestion){
              return ListTile(
                hoverColor: Colors.red,
                focusColor: Colors.grey,
                tileColor: Colors.black,
                leading: suggestion.poster_path != null
                ? Image.network(suggestion.poster_path)
                : Image.network("https://www.subscription.co.uk/time/europe/Solo/Content/Images/noCover.gif"),
                title: Text(suggestion.title, style: TextStyle(color: Colors.white),),
                subtitle: Text("Release date : " + suggestion.release_date.substring(0,4), style: TextStyle(color: Colors.white),),
              );
            },
            onSuggestionSelected: (suggestion){
              clear();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchDetail(suggestion)
              ));
            },
          ),
          SizedBox(height: 6,),
          Divider(color: textColor, thickness: 1),
          SizedBox(height: 60,),
          Container(
            //color: Colors.red,
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    print("clicked");
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                        "Select an IMDB Rating",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IMDBRating extends StatefulWidget {

  @override
  State<IMDBRating> createState() => _IMDBRatingState();
}

class _IMDBRatingState extends State<IMDBRating> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


