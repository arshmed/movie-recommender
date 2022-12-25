
class GenreModel{

  List<Result> results = [];

  GenreModel.fromJson(Map<String,dynamic> parsedJson){

    List<Result> temp = [];

    for(var i=0; i<parsedJson['genres'].length; i++){
      Result result = Result(parsedJson['genres'][i]);
      temp.add(result);
    }
    results=temp;
  }

  List<Result> get getGenres => results;
  String getGenre(List<int> ids){
    ids = ids.toSet().toList();
    String myGenre ="";

    for(var i=0; i<ids.length; i++){
      myGenre += results.where((user) => user.id == ids[i]).first.name + ", ";
    }

    myGenre = myGenre.substring(0, myGenre.length-2);
    return myGenre;
  }

}

class Result{

  int id;
  String name;

  Result(result){

    id=result['id'];
    name=result['name'].toString();
  }

  String get get_name => name;
  int get get_id => id;

}