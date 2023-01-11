import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviee/auth/auth_page.dart';
import 'package:moviee/auth/login_home_page.dart';
import 'package:moviee/auth/login_page.dart';
import 'package:moviee/ui/profile.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          // snapshot user hakkında bilgi verir

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // eğer kullanıcı verisi varsa log in olan kullanıcıyı
              // giriş yapıldıktan sonra gelen sayfaya götür
              return Profile();
            } else {
              // kullanıcı giriş yapmadıysa duruma göre register
              // veya log in sayfasını göster
              return AuthPage();
            }
          }),
    );
  }
}
