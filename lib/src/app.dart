import 'package:flutter/material.dart';
import 'pages/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
