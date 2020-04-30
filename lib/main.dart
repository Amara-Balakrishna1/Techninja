import "package:flutter/material.dart";
import 'package:techninja/pages/home.dart';
import 'package:techninja/pages/questions.dart';
import 'package:techninja/pages/result.dart';

void main() {
  return runApp(Techninja());
}

class Techninja extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/Questions': (context) => Questions(),
        '/Result': (context) => Result()
      },
    );
  }
}
