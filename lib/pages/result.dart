import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final double percentage;
  Result ({Key key, this.percentage}): super(key:key);
  
  Widget build(BuildContext context) {
    double showMarks = percentage*100;
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
                  "Congratulations you have successfully completed test and got $showMarks %",
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
