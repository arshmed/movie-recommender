class TrailerModel{

  List<TrailerResult> results = [];

  TrailerModel.fromJson(Map<String, dynamic> parsedJson){
    List<TrailerResult> temp = [];
    for(var i=0; i< parsedJson['results'].length; i++){
      TrailerResult result = TrailerResult(parsedJson['results'][i]);
      temp.add(result);
    }
    results = temp;
  }
  List<TrailerResult> get getTrailers => results;
}


class TrailerResult{

  String key;
  String name;

  TrailerResult(result){
    key = result['key'].toString();
    name = result['name'].toString();
  }

  String get get_key => key;
  String get get_name => name;

}