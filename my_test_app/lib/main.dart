import 'package:flutter/material.dart';
import 'package:my_test_app/screens/add_quote.dart';
import 'package:my_test_app/screens/home_screen.dart';
import 'package:my_test_app/screens/view_inspirational_quote..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ViewQuote(),
    );
  }
}
