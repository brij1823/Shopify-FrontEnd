import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shopify/models/search_movie_model.dart';

class NavigatorNominee extends StatefulWidget {
  List<SearchMovieModel> nomineeList = [];
  NavigatorNominee(this.nomineeList);
  @override
  _NavigatorNomineeState createState() => _NavigatorNomineeState(nomineeList);
}

class _NavigatorNomineeState extends State<NavigatorNominee> {
  List<SearchMovieModel> nomineeList = [];
  _NavigatorNomineeState(this.nomineeList);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Icon(EvaIcons.bellOutline),
          Text(
            "(" + nomineeList.length.toString() + ")",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
