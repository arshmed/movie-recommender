import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviee/ui/bottom_nav_bar.dart';
import 'package:moviee/ui/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Moviee',
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') {
      return child;
    }
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

class _SplashScreenState extends State<SplashScreen> {
  void NavigationPage() {
    Navigator.push(
        context, MyCustomRoute(builder: (context) => MainPage()));
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return Timer(_duration, NavigationPage);
  }

  @override
  void initState() {
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
          )),
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
