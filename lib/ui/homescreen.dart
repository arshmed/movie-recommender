import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviee/blocs/genre_bloc.dart';
import 'package:moviee/blocs/movies_bloc.dart';
import 'package:moviee/ui/movie_detail.dart';
import 'package:moviee/ui/recommended_movie.dart';
import '../model/genre_model.dart';
import '../model/item_model.dart';
import 'colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness:Brightness.light
    ));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PreLoadContent(),
      ),
    );
  }
}

class PreLoadContent extends StatefulWidget {
  const PreLoadContent({Key key}) : super(key: key);

  @override
  State<PreLoadContent> createState() => _PreLoadContentState();
}

class _PreLoadContentState extends State<PreLoadContent> {
  @override
  Widget build(BuildContext context) {
    bloc_genres.fetchAllGenres();
    return StreamBuilder(stream: bloc_genres.allGenres, builder: (context, AsyncSnapshot<GenreModel> snapshot) {
      if (snapshot.hasData) {
        return ContentPage(snapshot);
      }
      else if (snapshot.hasError) {
        print('something went wrong');
        return Text(snapshot.error.toString());
      }
      else
        return Center(child: CircularProgressIndicator());
    },
    );
  }
}


class ContentPage extends StatefulWidget {

  AsyncSnapshot<GenreModel> snapshotGenres;
  ContentPage(this.snapshotGenres);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
  }

  Widget getPopularMovies(){
    return StreamBuilder(stream: bloc.allMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
      if (snapshot.hasData) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 215,
          color: bgColor,
          child: Trends(snapshot,widget.snapshotGenres),
        );
      }
      else if (snapshot.hasError) {
        print('something went wrong');
        return Text(snapshot.error.toString());
      }
      else {
        return Center(child: CircularProgressIndicator());
      }
    },
    );
  }

  Widget getTopRatedMovies(){
    return StreamBuilder(stream: bloc.allTopRatedMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
      if (snapshot.hasData) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 215,
          color: bgColor,
          child: Trends(snapshot,widget.snapshotGenres),
        );
      }
      else if (snapshot.hasError) {
        print('something went wrong');
        return Text(snapshot.error.toString());
      }
      else
        return Center(child: CircularProgressIndicator());
    },
    );
  }

  Widget getUpcomingMovies(){
    return StreamBuilder(stream: bloc.allUpcomingMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
      if (snapshot.hasData) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 215,
          color: bgColor,
          child: Trends(snapshot,widget.snapshotGenres),
        );
      }
      else if (snapshot.hasError) {
        print('something went wrong');
        return Text(snapshot.error.toString());
      }
      else
        return Center(child: CircularProgressIndicator());
    },
    );
  }

  Widget getNowPlayingMovies(){
    return StreamBuilder(stream: bloc.allNowPlayingMovies, builder: (context, AsyncSnapshot<ItemModel> snapshot) {
      if (snapshot.hasData) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          color: bgColor,
          child: Trends(snapshot,widget.snapshotGenres),
        );
      }
      else if (snapshot.hasError) {
        print('something went wrong');
        return Text(snapshot.error.toString());
      }
      else
        return Center(child: CircularProgressIndicator());
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    bloc.fetchAllTopRatedMovies();
    bloc.fetchAllUpcomingMovies();
    bloc.fetchAllNowPlayingMovies();
    bloc.fetchInterstellar();
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1330,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                      child: StreamBuilder(stream: bloc.interstellar, builder: (context, AsyncSnapshot<ItemModel> snapshot){
                        if(snapshot.hasData){
                          return Container(
                            height: 320,
                            color: bgColor,
                            child: ItemsLoad(snapshot),
                          );
                        }
                        else if(snapshot.hasError){
                          print('something went wrong');
                          return Text(snapshot.error.toString());
                        }
                        else return Center(child: CircularProgressIndicator());
                      }
                      ),
                    ),
                      Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.only(left:20, top: 45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black
                        ),
                        child: Image.asset("images/playstore.png", height: 30, width: 30,),
                      ),
                      Positioned(
                        right: 50,
                          left: 50,
                          bottom: 8,
                          child: Text('INTERSTELLAR',style: TextStyle(fontSize: 30,fontFamily: 'SubstanceMedium',color: Colors.white)),),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Trends',
                      style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                    getPopularMovies(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                    child: Text(
                      'Top Rated',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  getTopRatedMovies(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  getUpcomingMovies(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                    child: Text(
                      'Now Playing',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  getNowPlayingMovies(),
                ],
              ),
            )
          ],
          ),
        ],
      ),
    );
  }
}

class Trends extends StatefulWidget {

  AsyncSnapshot<ItemModel> snapshot;
  AsyncSnapshot<GenreModel> snapshotGenres;
  Trends(this.snapshot, this.snapshotGenres);

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  @override
  Widget build(BuildContext context) {

        return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.snapshot.data.results.length,
      itemBuilder: (context, index){

        String genres = widget.snapshotGenres.data
            .getGenre(widget.snapshot.data.results[index].genre_ids);

        return Container(
          height: 200,
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetail(widget.snapshot.data.results[index],genres),
                      ),
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                          widget.snapshot.data.results[index].poster_path,
                        height: 210,
                        width: 140,
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8,),
            ],
          ),
        );
      },
    );
  }
}

class ItemsLoad extends StatefulWidget {
  AsyncSnapshot<ItemModel> snapshot;
  ItemsLoad(this.snapshot);
  @override
  State<ItemsLoad> createState() => _ItemsLoadState();
}

class _ItemsLoadState extends State<ItemsLoad> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecommendedMovie(widget.snapshot.data.results[0], null),
                ),
              );
              },
            child: Image.network(
                'https://media.idownloadblog.com/wp-content/uploads/2014/12/interstellar-wide-space-film-movie-art-9-wallpaper.jpg',
              height: 320,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}


