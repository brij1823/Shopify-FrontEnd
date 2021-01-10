import 'package:flutter/material.dart';
import 'package:shopify/models/search_movie_model.dart';
import 'package:shopify/style/theme.dart';
import 'package:shopify/widget/dialoghelper.dart';
import 'package:shopify/widget/display_results.dart';
import 'package:shopify/widget/navigator_nominee.dart';
import 'package:shopify/widget/nominated_movies.dart';
import 'package:shopify/widget/now_playing.dart';
import 'package:flutter/scheduler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SearchMovieModel> nomineeList = [];

  addMovie(SearchMovieModel movie) {
    this.setState(() {
      nomineeList.add(movie);
    });
  }

  removeMovie(SearchMovieModel movie) {
    this.setState(() {
      nomineeList.remove(movie);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFix.mainColor,
      appBar: AppBar(
        title: Text(
          'Shopify Movie Awards',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [NavigatorNominee(nomineeList)],
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          NowPlaying(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child:
                    DisplayResults(addMovie, removeMovie, nomineeList, context),
              ),
              Expanded(
                child: NominatedMovies(nomineeList, removeMovie),
              ),
            ],
          ),
          (nomineeList.length > 5) ? displayDialog(context) : Container(),
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
