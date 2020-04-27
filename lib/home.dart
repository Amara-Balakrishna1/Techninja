import "package:flutter/material.dart";
// import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  // init
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Wrap(children: [
          FlatButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed('/Questions');
              },
              child: Text("HTML"))
        ])));
  }
}
