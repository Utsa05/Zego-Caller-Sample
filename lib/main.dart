import 'package:flutter/material.dart';
import 'package:zego_caller_simple/home/view/home_view.dart';

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
      title: 'Zego Caller Sample',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeView(),
    );
  }
}
