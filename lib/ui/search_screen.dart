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
                hintText: "Movies...",
                hintStyle: TextStyle(color: textColor,fontSize: 24),
              ),
            ),
            suggestionsCallback: (pattern) async {
              return await BackendService.getSuggestions(pattern);
            },
            itemBuilder: (context, suggestion){
              return ListTile(
                tileColor: Colors.black,
                selectedTileColor: Colors.black,
                leading: suggestion.poster_path != null
                ? Image.network(suggestion.poster_path)
                : Image.network("https://www.subscription.co.uk/time/europe/Solo/Content/Images/noCover.gif"),
                title: Text(suggestion.title, style: TextStyle(color: Colors.white),),
                subtitle: Text("Release date : " + suggestion.release_date, style: TextStyle(color: Colors.white),),
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


