import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviee/ui/search_screen.dart';
import '../auth/main_page.dart';
import '../ui/homescreen.dart';

import 'i_feel_lucky.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

final user = FirebaseAuth.instance.currentUser;

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    HomeScreen(),
    Search(),
    Lucky(),
    LoginMainPage(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            height: 50,
            backgroundColor: Colors.black,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            animationDuration: Duration(seconds: 2),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home, color: Colors.grey),
                  selectedIcon: Icon(Icons.home),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.search, color: Colors.grey),
                  selectedIcon: Icon(Icons.search),
                  label: "Search"),
              NavigationDestination(
                  icon: Icon(Icons.sentiment_very_satisfied_outlined,
                      color: Colors.grey),
                  selectedIcon: Icon(Icons.sentiment_very_satisfied_outlined),
                  label: "I feel lucky"),
              NavigationDestination(
                  icon: Icon(Icons.person, color: Colors.grey),
                  selectedIcon: Icon(Icons.person),
                  label: "Profile"),
            ],
          ),
        ),
      );
}
