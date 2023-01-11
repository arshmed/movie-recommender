import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../blocs/trailer_bloc.dart';
import '../model/item_model.dart';
import '../model/trailer_model.dart';
import 'colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetail extends StatefulWidget {
  Result data;
  String genres;
  MovieDetail(this.data, this.genres);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

String backdrop_path = "";

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backdrop_path = widget.data.backdrop_path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(widget.data, widget.genres),
    );
  }
}

_launchURL(String _url) async {
  if (await canLaunch(_url)) {
    await launch(_url);
  } else {
    throw 'Could not launch $_url';
  }
}

class ContentPage extends StatefulWidget {
  Result data;
  String genres;
  ContentPage(this.data, this.genres);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    final user = FirebaseAuth.instance.currentUser;

    Future deleteFav() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("users-fav-items");

      return _collectionRef
          .doc(currentUser.email)
          .collection("movies")
          .doc(widget.data.title)
          .delete()
          .then((value) => print("Deleted from watch-later"));
    }

    Future deleteWatchLater() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("users-watch-later");

      return _collectionRef
          .doc(currentUser.email)
          .collection("movies")
          .doc(widget.data.title)
          .delete()
          .then((value) => print("Deleted from watch-laters"));
    }

    Future addFav() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("users-fav-items");

      return _collectionRef
          .doc(currentUser.email)
          .collection("movies")
          .doc(widget.data.title)
          .set({
        "name": widget.data.title,
        "images": widget.data.poster_path,
        "genre": widget.data.genre_ids,
        "score": widget.data.vote_average,
      }).then((value) => print("Added to favourites."));
    }

    Future addWatchLater() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("users-watch-later");

      return _collectionRef
          .doc(currentUser.email)
          .collection("movies")
          .doc(widget.data.title)
          .set({
        "name": widget.data.title,
        "images": widget.data.poster_path,
        "genre": widget.data.genre_ids,
        "score": widget.data.vote_average,
      }).then((value) => print("Added to watch later."));
    }

    if (user == null) {
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
                  image: NetworkImage(
                      widget.data.poster_path.replaceAll("w185", "w400")),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 40,
              child: IconButton(
                  color: Colors.red,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22,
                  )),
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
              top: 330,
              left: 20,
              child: Container(
                width: _width - 20,
                child: Text(
                  widget.data.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 370,
              child: GenresItems(widget.genres),
            ),
            Positioned(
              left: 22,
              top: 410,
              child: Text(
                widget.data.release_date.substring(0, 4),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 435,
              child: Container(
                width: _width,
                height: MediaQuery.of(context).size.height - 370,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 0.5,
                        color: textColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 3,
                              height: 120,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text(widget.data.popularity.toStringAsFixed(2), style: TextStyle(color: popularityColor, fontSize: 24, fontWeight: FontWeight.bold),),
                                    // Text('Popularity', style: TextStyle(color: Colors.white, ),),
                                    //Text(widget.data.release_date.substring(0,4), style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),)
                                    Text(
                                      widget.data.popularity.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Popularity',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 3,
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
                                        text:
                                            widget.data.vote_average.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' / 10',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 3,
                              height: 120,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.data.vote_count,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Vote Count',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.data.overview,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Trailers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            PreLoadContent(widget.data.id),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
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
                  image: NetworkImage(
                      widget.data.poster_path.replaceAll("w185", "w400")),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 40,
              child: IconButton(
                  color: Colors.red,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22,
                  )),
            ),
            Positioned(
              right: 15,
              top: 40,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users-fav-items")
                      .doc(FirebaseAuth.instance.currentUser.email)
                      .collection("movies")
                      .where("name", isEqualTo: widget.data.title)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Text("");
                    }
                    return IconButton(
                        color: Colors.red,
                        onPressed: () {
                          if (snapshot.data.docs.length == 0)
                            addFav();
                          else {
                            deleteFav();
                          }
                        },
                        icon: snapshot.data.docs.length == 0
                            ? Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 26,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 26,
                              ));
                  }),
            ),
            Positioned(
              right: 60,
              top: 40,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users-watch-later")
                      .doc(FirebaseAuth.instance.currentUser.email)
                      .collection("movies")
                      .where("name", isEqualTo: widget.data.title)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Text("");
                    }
                    return IconButton(
                        color: Colors.red,
                        onPressed: () {
                          if (snapshot.data.docs.length == 0)
                            addWatchLater();
                          else {
                            deleteWatchLater();
                          }
                        },
                        icon: snapshot.data.docs.length == 0
                            ? Icon(
                                Icons.bookmark_add_outlined,
                                color: Colors.white,
                                size: 26,
                              )
                            : Icon(
                                Icons.bookmark_add,
                                color: Colors.white,
                                size: 26,
                              ));
                  }),
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
              top: 330,
              left: 20,
              child: Container(
                width: _width - 20,
                child: Text(
                  widget.data.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 370,
              child: GenresItems(widget.genres),
            ),
            Positioned(
              left: 22,
              top: 410,
              child: Text(
                widget.data.release_date.substring(0, 4),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 435,
              child: Container(
                width: _width,
                height: MediaQuery.of(context).size.height - 370,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 0.5,
                        color: textColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 3,
                              height: 120,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text(widget.data.popularity.toStringAsFixed(2), style: TextStyle(color: popularityColor, fontSize: 24, fontWeight: FontWeight.bold),),
                                    // Text('Popularity', style: TextStyle(color: Colors.white, ),),
                                    //Text(widget.data.release_date.substring(0,4), style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),)
                                    Text(
                                      widget.data.popularity.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Popularity',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 3,
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
                                        text:
                                            widget.data.vote_average.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' / 10',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 3,
                              height: 120,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.data.vote_count,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Vote Count',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.data.overview,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Trailers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            PreLoadContent(widget.data.id),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
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
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container();
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return GetGenres(snapshot);
          }
        });
  }

  Widget GenreItem(String genre) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5.0),
        child: Text(
          genre,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<List<Widget>> _getGenres(String genre) async {
    var values = List<Widget>();
    var items = genre.split(',');

    for (int i = 0; i < items.length; i++) {
      if (i < 3) values.add(GenreItem(items[i]));
    }
    await Future.delayed(Duration(seconds: 0));
    return values;
  }

  Widget GetGenres(AsyncSnapshot snapshot) {
    List<Widget> values = snapshot.data;
    return Container(
      width: MediaQuery.of(context).size.width - 40,
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

class PreLoadContent extends StatefulWidget {
  int movieId;
  PreLoadContent(this.movieId);

  @override
  State<PreLoadContent> createState() => _PreLoadContentState();
}

class _PreLoadContentState extends State<PreLoadContent> {
  @override
  Widget build(BuildContext context) {
    bloc_trailer.fetchAllTrailers(widget.movieId);
    return StreamBuilder(
      stream: bloc_trailer.allTrailers,
      builder: (context, AsyncSnapshot<TrailerModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.results.length > 0) {
            int itemRowCount = (snapshot.data.results.length / 2).round();
            double _height = itemRowCount * 175.0;
            return Container(
              width: MediaQuery.of(context).size.width - 40,
              height: _height,
              child: TrailerPage(snapshot),
            );
          } else
            return Text(
              'Not Found Trailer',
              style: TextStyle(color: Colors.white),
            );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class TrailerPage extends StatefulWidget {
  AsyncSnapshot<TrailerModel> snapshot;
  TrailerPage(this.snapshot);

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 16) / 2;
    return GridView.count(
      padding: EdgeInsets.all(0),
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / 155),
      crossAxisSpacing: 16,
      mainAxisSpacing: 22,
      physics: NeverScrollableScrollPhysics(),
      children: List<Widget>.generate(
        widget.snapshot.data.results.length,
        (index) {
          return GridTile(
            child: InkWell(
              onTap: () => _launchURL("https://www.youtube.com/watch?v=" +
                  widget.snapshot.data.results[index].key),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () => _launchURL("https://www.youtube.com/watch?v=" +
                      widget.snapshot.data.results[index].key),
                  child: Wrap(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Stack(
                          children: [
                            Image.network(backdrop_path),
                            Container(
                              width: itemWidth,
                              height: 100,
                              color: Colors.black38,
                            ),
                            Positioned(
                              top: 36,
                              left: (itemWidth - 36 - 16) / 2,
                              child: Icon(Icons.play_circle_filled,
                                  size: 36, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.snapshot.data.results[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
