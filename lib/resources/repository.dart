import 'package:moviee/model/genre_model.dart';
import 'package:moviee/resources/movie_api_provider.dart';

import '../model/item_model.dart';
import '../model/trailer_model.dart';

class Repository{

  final movieapiprovider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => movieapiprovider.fetchPopularMovieList();
  Future<ItemModel> fetchAllTopRatedMovies() => movieapiprovider.fetchTopRatedMovieList();
  Future<ItemModel> fetchAllUpcomingMovies() => movieapiprovider.fetchUpcomingMovieList();
  Future<ItemModel> fetchAllNowPlayingMovies() => movieapiprovider.fetchNowPlayingMovieList();
  Future<ItemModel> fetchInterstellar() => movieapiprovider.fetchInterstellar();
  Future<GenreModel> fetchAllGenres() => movieapiprovider.fetchGenresList();
  Future<TrailerModel> fetchTrailers(int movieId) => movieapiprovider.fetchTrailers(movieId);


}