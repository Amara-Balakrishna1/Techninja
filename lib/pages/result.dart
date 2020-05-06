import "package:flutter/material.dart";

class Result extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            // padding: EdgeInsets.all(20.0),
            child: Column(children: [
          Container(
            height: 400.0,
            padding: EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                  "Congratulations you have successfully completed test",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 18.0)),
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Home"),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          )
        ])));
  }
}
