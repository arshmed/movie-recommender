import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviee/ui/colors.dart';
import 'package:moviee/ui/homescreen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Moviee',
    home: SplashScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute(
      {  WidgetBuilder builder,  RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.name == '/') {
      return child;
    }
      // Fades between routes. (If you don't want any animation,
      // just return child.)
      return FadeTransition(opacity: animation, child: child);
  }
}

class _SplashScreenState extends State<SplashScreen> {

  void NavigationPage(){
    Navigator.push(
        context,
       MyCustomRoute(builder: (context) => new HomeScreen())
        );
  }

  startTime() async{
    var _duration = new Duration(seconds: 2);
    return Timer(_duration, NavigationPage);
  }

  @override
  void initState(){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black,
                  bgColor,
                ],
              )
          ),
          child: Center(
            child: GradientText(
              'MOVIEE',
              style: TextStyle(
                fontSize: 56.0,
              ),
              colors: [
                Colors.blue,
                Colors.red,
                Colors.teal,
              ],
            ),
          ),
        ),
      ),
    );
  }
}


