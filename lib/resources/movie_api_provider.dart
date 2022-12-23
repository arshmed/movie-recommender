// import 'dart:convert';
// import 'dart:html';

// import 'package:http/http.dart' show Client;

// import '../model/item_model.dart';

// class MovieApiProvider {
//   Client client = Client();
//   final apiKey = "4b93d35d5c2089b7716defdd6d32c769";
//   final baseUrl = "https://api.themoviedb.org/3/movie";

//   Future<ItemModel> fetchPopularMovieList() async {
//     //print('entered');
//     final response = await client
//         .get("https://api.themoviedb.org/3/movie/popular?api_key=$apiKey");
//     //print(response.body.toString());
//     if (response.statusCode == 200) {
//       return ItemModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load movies");
//     }
//   }

//   Future<ItemModel> fetchTopRatedMovieList() async {
//     //print('entered');
//     final response = await client
//         .get("https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey");
//     //print(response.body.toString());
//     if (response.statusCode == 200) {
//       return ItemModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load movies");
//     }
//   }

//   Future<ItemModel> fetchUpcomingMovieList() async {
//     //print('entered');
//     final response = await client
//         .get("https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey");
//     //print(response.body.toString());
//     if (response.statusCode == 200) {
//       return ItemModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load movies");
//     }
//   }

//   Future<ItemModel> fetchNowPlayingMovieList() async {
//     //print('entered');
//     final response = await client
//         .get("https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey");
//     //print(response.body.toString());
//     if (response.statusCode == 200) {
//       return ItemModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load movies");
//     }
//   }
// }
