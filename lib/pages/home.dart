import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:techninja/models/techstackmodel.dart';
import 'package:techninja/models/argumentsmodal.dart';

// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  // init
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Techstackmodel> stacks = [];
  void getData() async {
    var data = await rootBundle.loadString('assets/json/TechStack.json');
    var jsonResult = jsonDecode(data);
    List<Techstackmodel> newStacks = [];
    for (var data in jsonResult) {
      Techstackmodel stack = Techstackmodel(data["name"]);
      newStacks.add(stack);
    }
    setState(() {
      stacks = newStacks;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tap a tile to Proceed")),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
              direction: Axis.horizontal,
              children: stacks.map((e) {
                return Container(
                    height: 80.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 2.0, color: Colors.blue)),
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context,'/Rating',arguments:PageArguments(e.techName));
                        },
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          e.techName,
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        )));
              }).toList())),
    );
  }
}
