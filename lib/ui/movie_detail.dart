import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/item_model.dart';
import 'colors.dart';

class MovieDetail extends StatefulWidget {

  Result data;
  String genres;
  MovieDetail(this.data,this.genres);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(widget.data,widget.genres),
    );
  }
}

class ContentPage extends StatefulWidget {

  Result data;
  String genres;
  ContentPage(this.data,this.genres);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height,
      color: bgColor,
      child: Stack(
        children: [
          Container(
            height: 380,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(widget.data.poster_path.replaceAll("w185", "w400")),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 40,
            child: IconButton(
                color: Colors.red,
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios,  color: Colors.white, size: 22,)
            ),
          ),
          Positioned(
            top: 320,
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 8),
              width: _width,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                    colors: [
                      bgColor.withOpacity(0.01),
                      bgColor.withOpacity(0.25),
                      bgColor.withOpacity(0.6),
                      bgColor.withOpacity(0.9),
                      bgColor,
                    ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 308,
              left: 20,
              child: Container(
                width: _width - 20,
                child: Text(widget.data.title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
          ),
          Positioned(
            left: 20,
            top: 340,
              child: GenresItems(widget.genres),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 390,
            child: Container(
              width: MediaQuery.of(context).size.width -40,
              height: 0.5,
              color: textColor,
            ),
          ),
          Positioned(
            top: 370,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width -40) / 3,
                        height: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.data.popularity.toStringAsFixed(2), style: TextStyle(color: popularityColor, fontSize: 24, fontWeight: FontWeight.bold),),
                              Text('Popularity', style: TextStyle(color: Colors.white, ),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width -40) / 3,
                        height: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: iconColor,
                                size: 28,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: widget.data.vote_average.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' / 10',
                                      style: TextStyle(
                                        color: Colors.white, fontSize: 18
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width -40) / 3,
                        height: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.data.vote_count.toString(), style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),),
                              Text('Vote Count', style: TextStyle(color: Colors.white, ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 480,
            child: Container(
              width: MediaQuery.of(context).size.width -40,
              height: 0.5,
              color: textColor,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 500,
            child: Container(
              width: MediaQuery.of(context).size.width -40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    widget.data.overview,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenresItems extends StatefulWidget {

  String genres;
  GenresItems(this.genres);

  @override
  State<GenresItems> createState() => _GenresItemsState();
}

class _GenresItemsState extends State<GenresItems> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getGenres(widget.genres),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container();
            default:
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          else
            return GetGenres(snapshot);
          }
        }
    );
  }

  Widget GenreItem(String genre){
    return
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:10, right: 10, top: 5, bottom: 5.0),
          child: Text(genre, style: TextStyle(color: Colors.white),),
        ),
      );

  }

    Future<List<Widget>> _getGenres(String genre) async {
      var values =  List<Widget>();
      var items = genre.split(',');

      for(int i=0; i<items.length; i++){
        if(i < 3)
        values.add(GenreItem(items[i]));
      }
      await Future.delayed(Duration(seconds: 0));
      return values;
    }

    Widget GetGenres(AsyncSnapshot snapshot){
    List<Widget> values = snapshot.data;
    return Container(
      width: MediaQuery.of(context).size.width -40,
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 8,
        spacing: 8,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: values,
      ),
    );
    }

}

