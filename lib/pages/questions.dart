import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:math';
import 'package:techninja/models/questionsmodel.dart';
import 'package:techninja/widgets/questionWidget.dart';

class QuestionsPage extends StatefulWidget {
  final int rating;
  const QuestionsPage({Key key, this.rating}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<Questionsmodel> questions = [];
  int activeQuestion = 0;
  // String pageInfo = widget.pageInfo.pageInfo;
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
    if (newquestions.length > 0) {
      int mean = (newquestions.length / 3).round(), rating = this.widget.rating;
      List<int> nums = getRandomTen((rating - 1) * mean);
      for (int i = 0; i < nums.length; i++) {
        selectedQuestions.add(newquestions[nums[i]]);
      }

      setState(() {
        questions = selectedQuestions;
      });
    }
  }

  List getRandomTen(int min) {
    List<int> randomInt = [];
    var rng = new Random();
    int value = min;
    while (randomInt.length < 10) {
      value += rng.nextInt(10) % 2 == 0 ? 2 : 1;
      randomInt.add(value);
    }
    return randomInt;
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
                      activeQuestion + 1, setSelectedOption, questions.length)
                  : Text("Loading ..."),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FlatButton(
                    color: Colors.blue,
                    onPressed: setActiveQuestion,
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 10.0,
                ),
                activeQuestion == (questions.length - 1)
                    ? FlatButton(
                        color: Colors.blue[200],
                        onPressed: () {
                          int marks = 0;
                          questions.forEach((element) {
                            if (element.selectedAnswer ==
                                element.orginalAnswer) {
                              marks++;
                            }
                          });
                          Navigator.of(context).pushNamed('/Result',
                              arguments: (marks / questions.length));
                        },
                        child: Text("Submit"))
                    : FlatButton(
                        color: Colors.blue,
                        onPressed: setActiveQuestion,
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ))
              ])
            ])));
  }
}
