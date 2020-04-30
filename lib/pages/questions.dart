import "package:flutter/material.dart";

class Questions extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green[50],
        child: SafeArea(
          child: Wrap(children: [
            Text("Questions"),
            FlatButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.green,
              child: Text("Result"),
              onPressed: () {
                Navigator.of(context).pushNamed('/Result');
              },
            )
          ]),
        ));
  }
}
