import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviee/ui/login_home_page.dart';
import 'package:moviee/ui/login_page.dart';
import 'package:moviee/ui/profile.dart';

class MainPage1 extends StatelessWidget {
  const MainPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  LoginPage();
            } else {
              return Profile();
            }
          }),
    );
  }
}
