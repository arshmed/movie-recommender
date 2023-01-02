import 'package:flutter/material.dart';


class Lucky extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            child: Image.network(
              "https://picsum.photos/seed/picsum/300/300",
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            height: 48,
            width: double.infinity,
            child: Text(
              "yazyazyaz",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            height: 48,
            width: double.infinity,
            child: Text(
              "yazyazyaz",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            height: 48,
            width: double.infinity,
            child: Text(
              "yazyazyaz",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            height: 52,
            width: double.infinity,
            child: Text(
              "yazyazyaz",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.white70,
        child: const Icon(Icons.auto_awesome_sharp, color: Colors.black),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22.0))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}