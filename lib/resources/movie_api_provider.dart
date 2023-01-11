import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../model/genre_model.dart';
import '../model/item_model.dart';
import '../model/trailer_model.dart';

class MovieApiProvider{

  Client client = Client();
  final apiKey = "4b93d35d5c2089b7716defdd6d32c769";
  final baseUrl = "https://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchPopularMovieList() async{
    //print('entered');
    final response = await client.get(Uri.parse("$baseUrl/popular?api_key=$apiKey"));
    //print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load movies");
    }
  }

  Future<ItemModel> fetchTopRatedMovieList() async{
    //print('entered');
    final response = await client.get(Uri.parse("$baseUrl/top_rated?api_key=$apiKey"));
    //print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load movies");
    }
  }

  Future<ItemModel> fetchUpcomingMovieList() async{
    //print('entered');
    final response = await client.get(Uri.parse("$baseUrl/upcoming?api_key=$apiKey"));
    //print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load movies");
    }
  }

  Future<ItemModel> fetchNowPlayingMovieList() async{
    //print('entered');
    final response = await client.get(Uri.parse("$baseUrl/now_playing?api_key=$apiKey"));
    //print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load movies");
    }
  }

  Future<ItemModel> fetchInterstellar() async{
    //print('entered');
    final response = await client.get(Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=4b93d35d5c2089b7716defdd6d32c769&query=interstellar&page=1&include_adult=false"));
    //print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load movies");
    }
  }

  Future<GenreModel> fetchGenresList() async{
    //print('entered');
    final response = await client.get(Uri.parse("https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey"));
    //print(response.body.toString());
    if(response.statusCode == 200){
      return GenreModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load movies");
    }
  }

  Future<TrailerModel> fetchTrailers(int movie_id) async{
    //print('entered');
    final response = await client.get(Uri.parse(baseUrl + "/" + movie_id.toString() + "/videos?api_key=$apiKey"));
    //print(response.body.toString());
    if(response.statusCode == 200){
      return TrailerModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load post");
    }
  }

}