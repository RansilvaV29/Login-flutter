import 'package:flutter/material.dart';
import 'package:pry_login/views/loginPage.dart';
import 'package:pry_login/views/registerPage.dart';
import 'views/loginPage.dart';
import 'views/wellcomePage.dart';
import 'views/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/wellcome': (context) => Wellcomepage(),
        '/register': (context) => RegisterPage(), // ← añade esta línea
      },
    );
  }
}
