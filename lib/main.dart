import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(18),
                  side: const BorderSide(
                      width: 2, color: Color.fromARGB(168, 81, 80, 80)),
                  shape: const CircleBorder())),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(168, 81, 80, 80),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(18))),
          textTheme: const TextTheme(
              headlineLarge: TextStyle(fontSize: 75),
              headlineMedium: TextStyle(fontSize: 40),
              headlineSmall:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.w300))),
      home: const Calculator(),
    );
  }
}
