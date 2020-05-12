import 'package:flutter/material.dart';
import 'package:techninja/pages/home.dart';
import 'package:techninja/pages/questions.dart';
import 'package:techninja/pages/rating.dart';
import 'package:techninja/pages/result.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      {
        return MaterialPageRoute(builder: (context) => Home());
      }
    case '/Rating': {
      return MaterialPageRoute(builder: (context) => Ratingpage(pageInfo: settings.arguments));
    }
    case '/Questions':
      {
        return MaterialPageRoute(builder: (context) => QuestionsPage(rating: settings.arguments));
      }
    case '/Result':
      {
        return MaterialPageRoute(builder: (context) => Result(percentage: settings.arguments));
      }
      default: return MaterialPageRoute(builder: (context) => Home());
  }
}
