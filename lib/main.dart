import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              actionsIconTheme: IconThemeData(color: Colors.black),
              brightness: Brightness.light,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              textTheme: TextTheme(title: TextStyle(color: Colors.black))),
          backgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}
