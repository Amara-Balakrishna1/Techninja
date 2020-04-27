import "package:flutter/material.dart";
import 'package:techninja/home.dart';
import 'package:techninja/questions.dart';
import 'package:techninja/result.dart';

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
