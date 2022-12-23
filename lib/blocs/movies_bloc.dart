// import 'package:moviee/model/item_model.dart';
// import 'package:rxdart/rxdart.dart';

// import '../resources/repository.dart';

// class MoviesBloc{

//   final repo = Repository();

//   final movieFetcher = PublishSubject<ItemModel>();
//   final movieFetcher2 = PublishSubject<ItemModel>();
//   final movieFetcher3 = PublishSubject<ItemModel>();
//   final movieFetcher4 = PublishSubject<ItemModel>();

//   Stream<ItemModel> get allMovies => movieFetcher.stream;
//   Stream<ItemModel> get allTopRatedMovies => movieFetcher2.stream;
//   Stream<ItemModel> get allUpcomingMovies => movieFetcher3.stream;
//   Stream<ItemModel> get allNowPlayingMovies => movieFetcher4.stream;

//   fetchAllMovies() async{
//     ItemModel itemModel = await repo.fetchAllMovies();
//     movieFetcher.sink.add(itemModel);
//   }

//   fetchAllTopRatedMovies() async{
//     ItemModel itemModel = await repo.fetchAllTopRatedMovies();
//     movieFetcher2.sink.add(itemModel);
//   }

//   fetchAllUpcomingMovies() async{
//     ItemModel itemModel = await repo.fetchAllUpcomingMovies();
//     movieFetcher3.sink.add(itemModel);
//   }

//   fetchAllNowPlayingMovies() async{
//     ItemModel itemModel = await repo.fetchAllNowPlayingMovies();
//     movieFetcher4.sink.add(itemModel);
//   }

//   dispose(){
//     movieFetcher.close();
//   }

// }

// final bloc = MoviesBloc();