import 'package:flutter/material.dart';

import '../main.dart';
import '../ui/profile.dart';
import '../ui/homescreen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int index=0;
  final screens=[
    HomeScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    body:screens[index],
    bottomNavigationBar: NavigationBarTheme(
  data:NavigationBarThemeData(
    indicatorColor:Colors.white,
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500)
    ),
  ),
    child:NavigationBar(
      height: 60,
      backgroundColor: Colors.black,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: index,
      animationDuration: Duration(seconds: 3),
      onDestinationSelected:(index) =>
      setState(() => this.index=index),
      destinations: [
        NavigationDestination(icon: Icon(Icons.home,color: Colors.white),
            selectedIcon: Icon(Icons.home),
            label: "Home"),
        NavigationDestination(icon: Icon(Icons.person,color: Colors.white),
            selectedIcon: Icon(Icons.person),
            label: "Profile"),
        NavigationDestination(icon: Icon(Icons.sentiment_very_satisfied_outlined,color: Colors.white),
            selectedIcon: Icon(Icons.sentiment_very_satisfied_outlined),
            label: "I feel lucky"),
        NavigationDestination(icon: Icon(Icons.search,color: Colors.white),
            selectedIcon: Icon(Icons.search),
            label: "Search"),

      ],
  ),
    ),
  );

}

