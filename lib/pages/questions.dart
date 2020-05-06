import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:math';
import 'package:techninja/models/questionsmodel.dart';
import 'package:techninja/widgets/questionWidget.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<Questionsmodel> questions = [];
  int activeQuestion = 0;
  getQuestions() async {
    var data = await rootBundle.loadString('assets/json/Questions.json');
    var jsonResult = jsonDecode(data);
    List<Questionsmodel> newquestions = [];
    List<Questionsmodel> selectedQuestions = [];
    for (var data in jsonResult) {
      Questionsmodel stack = Questionsmodel(data["question"],
          data["selectedAnswer"], data["orginalAnswer"], data["options"]);
      newquestions.add(stack);
    }
    var rng = new Random();
    var nums = new List.generate(10, (_) => rng.nextInt(newquestions.length));
    nums.shuffle();
    for (int i = 0; i < nums.length; i++) {
      selectedQuestions.add(newquestions[nums[i]]);
    }

    setState(() {
      questions = selectedQuestions;
    });
  }

  void setActiveQuestion() {
    if (activeQuestion < (questions.length - 1)) {
      setState(() {
        activeQuestion += 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  void setSelectedOption(e) {
    List updateQuestions = questions;
    updateQuestions[activeQuestion].selectedAnswer = e;
    setState(() {
      questions = updateQuestions;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              questions.length != 0
                  ? questionWidget(questions[activeQuestion],
                      activeQuestion + 1, setSelectedOption)
                  : Text("Loading ..."),
              activeQuestion == (questions.length - 1)
                  ? FlatButton(
                      color: Colors.blue[200],
                      onPressed: () {
                        Navigator.of(context).pushNamed('/Result');
                      },
                      child: Text("Submit"))
                  : FlatButton(
                      color: Colors.blue,
                      onPressed: setActiveQuestion,
                      child: Text(
                        "Next Question",
                        style: TextStyle(color: Colors.white),
                      ))
            ])));
  }
}
