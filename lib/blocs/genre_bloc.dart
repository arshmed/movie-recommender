import 'package:moviee/model/genre_model.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class GenreBloc{

  final repo = Repository();

  final movieFetcher = PublishSubject<GenreModel>();


  Stream<GenreModel> get allGenres => movieFetcher.stream;

  fetchAllGenres() async{
    GenreModel itemModel = await repo.fetchAllGenres();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }

}

final bloc_genres = GenreBloc();