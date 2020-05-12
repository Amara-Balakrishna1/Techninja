import 'package:flutter/material.dart';
import 'package:techninja/models/questionsmodel.dart';

class questionWidget extends StatelessWidget {
  final int index, count;
  final Questionsmodel question;
  final Function setSelectedOption;
  questionWidget(this.question, this.index, this.setSelectedOption, this.count);

  Widget build(BuildContext context) {
    final String string = question.question;
    return Container(
      height: 700.0,
      child: Column(children: [
        Flexible(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[200],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(width: 2.0, color: Colors.blue)),
                // height: 100.0,
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(10.0),
                child: Row(
                    // height: 200.0,
                    // color: Colors.red,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 1)),
                    children: [
                      Flexible(
                          child: RichText(
                              text: TextSpan(children: [
                        TextSpan(
                            text: "Question $index of $count.",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0)),
                        TextSpan(
                            text: "\n \n ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0)),
                        TextSpan(
                            text: string,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ])))
                    ]))),
        ...question.options
            .map((e) => Row(children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setSelectedOption(e);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: question.selectedAnswer == e
                                      ? Colors.blue[50]
                                      : null,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      width: 2.0, color: Colors.blue)),
                              padding: EdgeInsets.all(15.0),
                              margin: EdgeInsets.all(15.0),
                              child: Text(e,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 18.0)))))
                ]))
            .toList(),
      ]),
    );
  }
}
