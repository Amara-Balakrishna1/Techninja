import "package:flutter/material.dart";
import "package:techninja/route.dart" as router;

void main() {
  return runApp(Techninja());
}

class Techninja extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      initialRoute: '/',
      onGenerateRoute: router.generateRoute,
    );
  }
}
