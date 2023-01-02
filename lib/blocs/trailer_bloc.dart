
import 'package:moviee/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/trailer_model.dart';

class TrailerBloc{

  final repository = Repository();
  final movieFetcher = PublishSubject<TrailerModel>();
  Stream<TrailerModel> get allTrailers => movieFetcher.stream;

  fetchAllTrailers(int movieId) async{
    TrailerModel itemModel = await repository.fetchTrailers(movieId);
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }

}
final bloc_trailer = TrailerBloc();