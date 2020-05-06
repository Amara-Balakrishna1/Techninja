import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:techninja/models/argumentsmodal.dart';

class Ratingpage extends StatefulWidget {
  final PageArguments pageInfo;
  const Ratingpage({Key key, this.pageInfo}) : super(key: key);

  @override
  _RatingpageState createState() => _RatingpageState();
}

class _RatingpageState extends State<Ratingpage> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    String pageInfo = widget.pageInfo.pageInfo;
    return Container(
        height: 600.0,
        color: Colors.white,
        child: Stack(
          // alignment: AlignmentDirectional.bottomStart,
          fit: StackFit.loose,
          children: [
            Align(
                alignment: Alignment(0.0, -0.20),
                child: Text(
                  "Rate your self in $pageInfo",
                  style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                )),
            Align(
                alignment: Alignment(0.0, -0.10),
                child: Text(
                  "(Swipe on stars to rate)",
                  style: TextStyle(fontSize: 10.0, color: Colors.black54),
                )),
            Align(
                alignment: Alignment(0.0, 0.0),
                child: SmoothStarRating(
                    allowHalfRating: true,
                    onRatingChanged: (v) {
                      setState(() {
                        rating = v;
                      });
                    },
                    rating: rating,
                    starCount: 5,
                    size: 60.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    color: Colors.green,
                    borderColor: Colors.green[300],
                    spacing: 0.0)),
            Align(
                alignment: Alignment(0.0, 0.20),
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Questions');
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ));
  }
}
