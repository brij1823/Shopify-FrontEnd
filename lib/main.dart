import 'package:flutter/material.dart';
import 'package:shopify/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopify',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(),
    );
  }
}
