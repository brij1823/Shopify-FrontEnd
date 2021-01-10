import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shopify/models/search_movie_model.dart';
import 'package:shopify/widget/emaildialoghelper.dart';

class NominatedMovies extends StatefulWidget {
  List<SearchMovieModel> nomineeList = [];
  Function removeMovie;
  NominatedMovies(this.nomineeList, this.removeMovie);
  @override
  _NominatedMoviesState createState() =>
      _NominatedMoviesState(nomineeList, removeMovie);
}

class _NominatedMoviesState extends State<NominatedMovies> {
  List<SearchMovieModel> nomineeList = [];
  Function removeMovie;
  _NominatedMoviesState(this.nomineeList, this.removeMovie);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Movies you nominated',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              (nomineeList.length > 0)
                  ? IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        EmailDialogHelper.exit(context, nomineeList);
                      },
                      color: Colors.amber,
                      iconSize: 30,
                    )
                  : Container(),
            ],
          ),
          _displayMovies(nomineeList),
        ],
      ),
    );
  }

  Widget _displayMovies(nomineeList) {
    if (nomineeList.length == 0) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'No Movies Present',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (SearchMovieModel movie in nomineeList)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    (movie.Title.length < 15)
                        ? movie.Title
                        : movie.Title.substring(1, 15) + '...',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    removeMovie(movie);
                  },
                  color: Colors.amber,
                  child: Text('Remove'),
                ),
              ],
            )
        ],
      );
    }
  }
}
