import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = new Card(

      color:Colors.black,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Divider(color: Colors.white,indent: 16.0,),
          new ListTile(
            leading: new Icon(Icons.person, color: Colors.white,size: 26.0,),
            title: new Text("Information"
              ,style: new TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
          ),
          new Divider(color: Colors.white,indent: 16.0,),
          new ListTile(
            leading: new Icon(Icons.favorite, color: Colors.white, size: 26.0,),
            title: new Text("Favorites"
              ,style: new TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
          ),
          new Divider(color: Colors.white,indent: 16.0,),
          new ListTile(
            leading: new Icon(Icons.book, color: Colors.white, size: 26.0,),
            title: new Text("History"
              ,style: new TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
          ),
          new Divider(color: Colors.white,indent: 16.0,),
        ],
      ),
    );
    final sizedBox = new Container(
      child: new SizedBox(
        height: 550.0,
        child: card,
      ),
    );
    final center = new Center(
      child: sizedBox,
    );
    return new MaterialApp(


        title: "",
        home: new Scaffold(
          backgroundColor: Colors.black,appBar: new AppBar(
            centerTitle: true,
            backgroundColor: Colors.black87,
            title: new Text("Profile")
        ),
          body: center,
        )
    );
  }
}