import 'package:flutter/material.dart';
import 'package:shopify/bloc/get_search_movie_bloc.dart';
import 'package:shopify/models/search_movie_model.dart';

class SearchResult extends StatefulWidget {
  var query;
  SearchResult(this.query);
  @override
  _SearchResultState createState() => _SearchResultState(query);
}

class _SearchResultState extends State<SearchResult> {
  var query = "";
  _SearchResultState(this.query);

  @override
  void initState() {
    super.initState();
    getSearchedBloc.getSearchMovies(query);
  }

  @override
  Widget build(BuildContext context) {
    //getSearchedBloc.getSearchMovies(this.query);
    return StreamBuilder(
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
    return Container();
  }
}
