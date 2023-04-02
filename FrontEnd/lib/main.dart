import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_app/screens/home_screen.dart';
import 'package:my_test_app/screens/view_inspirational_quote..dart';

import 'controllers/data_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  loadingData() async {
    await Get.find<DataController>().getQuotes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadingData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
