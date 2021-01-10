import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shopify/models/search_movie_model.dart';
import 'package:shopify/style/theme.dart';
import 'package:shopify/widget/dialoghelper.dart';

class DisplayMovies extends StatefulWidget {
  SearchMovieModel searchMovieModel;
  Function addMovie, removeMovie;
  List<SearchMovieModel> nomineeList;
  var context;
  DisplayMovies(this.searchMovieModel, this.addMovie, this.removeMovie,
      this.nomineeList, this.context);

  @override
  _DisplayMoviesState createState() => _DisplayMoviesState();
}

class _DisplayMoviesState extends State<DisplayMovies> {
  bool nominee = false;
  bool limit = false;
  int limitValue = 5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 200,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: NetworkImage(widget.searchMovieModel.Poster),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\"" + widget.searchMovieModel.Title + "\"",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Year : " + widget.searchMovieModel.Year,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Release Date : " + widget.searchMovieModel.Released,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 50,
              ),
              (widget.nomineeList.length < 5)
                  ? widget.nomineeList.contains(widget.searchMovieModel)
                      ? RaisedButton(
                          onPressed: () {
                            this.setState(() {
                              widget.removeMovie(widget.searchMovieModel);
                              nominee = !nominee;
                            });
                          },
                          color: Colors.amber,
                          child: Text(
                            'Nominated',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            this.setState(() {
                              print(widget.searchMovieModel);
                              widget.addMovie(widget.searchMovieModel);
                              nominee = !nominee;
                            });
                          },
                          color: Colors.amber,
                          child: Text(
                            'Nominate',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                  : RaisedButton(
                      onPressed: () {
                        displayDialog(widget.context);
                      },
                      color: Colors.grey,
                      child: Text(
                        'Nominate',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }

  Widget displayDialog(context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => DialogHelper.exit(context));
    return Container();
  }
}
