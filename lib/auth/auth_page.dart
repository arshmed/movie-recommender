import 'package:flutter/material.dart';
import 'package:moviee/auth/login_page.dart';
import 'package:moviee/auth/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // ilk olarak login page göster
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  // initally show the login page
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      //temel olarak login page göster

      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(
        showLoginPage: toggleScreens,
      );
    }
  }
}
