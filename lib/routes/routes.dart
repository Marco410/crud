import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/home.dart';
import 'package:prueba_tecnica/screens/login.dart';
import 'package:prueba_tecnica/screens/posts/detail.dart';
import 'package:prueba_tecnica/screens/user/perfil.dart';

class PageRoutes {
  static const String login = 'login';
  static const String home = 'home';
  static const String perfil = 'perfil';
  static const String postDetail = 'postDetail';

  Map<String, WidgetBuilder> routes() {
    return {
      login: (context) => const LoginPage(),
      home: (context) => const HomePage(),
      perfil: (context) => const PerfilPage(),
      postDetail: (context) => const PostDetail(),
    };
  }
}
