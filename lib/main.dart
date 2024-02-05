import 'package:flutter/material.dart';
import 'package:myfood/views/routes/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'MyFood',
      home: HomePage(),
    );
  }
}
