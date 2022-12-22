import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageLogin extends StatefulWidget {
  const HomePageLogin({Key key}) : super(key: key);

  @override
  State<HomePageLogin> createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLogin> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Signed in"),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.deepOrange,
            child: const Text("Sign out!"),
          )
        ],
      )),
    );
  }
}
