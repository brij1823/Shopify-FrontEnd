import 'package:flutter/material.dart';
import 'package:shopify/bloc/get_search_movie_bloc.dart';
import 'package:shopify/models/search_movie_model.dart';
import 'package:shopify/widget/displayMovies.dart';
import 'package:shopify/widget/search_result.dart';

class DisplayResults extends StatefulWidget {
  Function addMovie, removeMovie;
  List<SearchMovieModel> nomineeList = [];
  var context;
  DisplayResults(
      this.addMovie, this.removeMovie, this.nomineeList, this.context);
  @override
  _DisplayResultsState createState() => _DisplayResultsState(
      addMovie, removeMovie, this.nomineeList, this.context);
}

class _DisplayResultsState extends State<DisplayResults> {
  String searched_text = "";
  Function addMovie, removeMovie;
  List<SearchMovieModel> nomineeList = [];
  var context;
  _DisplayResultsState(
      this.addMovie, this.removeMovie, this.nomineeList, this.context);
  @override
  void initState() {
    super.initState();
    getSearchedBloc.getSearchMovies(searched_text);
  }

  updateQuery(query) {
    getSearchedBloc.getSearchMovies(query);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.only(left: 100, right: 100),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                prefixIcon: Icon(Icons.search, color: Colors.amber),
                hintText: 'Search for movies',
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              onChanged: (val) {
                this.setState(() {
                  searched_text = val;
                  getSearchedBloc.getSearchMovies(searched_text);
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "You Search for : " + searched_text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //SearchResult(this.searched_text),
        //updateQuery(searched_text),
        StreamBuilder(
          stream: getSearchedBloc.subject.stream,
          builder: (context, AsyncSnapshot<SearchMovieModel> snapshot) {
            if (snapshot.hasData) {
              return _buildHomeWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildHomeWidget(SearchMovieModel data) {
    var fetchedData = data;
    return fetchedData.Title == null
        ? Container()
        : DisplayMovies(
            fetchedData, addMovie, removeMovie, nomineeList, context);
  }
}
