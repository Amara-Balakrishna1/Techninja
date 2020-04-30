import "package:flutter/material.dart";

class Result extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
        child: SafeArea(
            // padding: EdgeInsets.all(20.0),
            child: Wrap(children: [
      RaisedButton(
        color: Colors.green,
        child: Text("Home"),
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
      )
    ])));
  }
}
