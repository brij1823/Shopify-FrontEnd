import 'package:rxdart/rxdart.dart';
import 'package:shopify/models/search_movie_model.dart';
import 'package:shopify/repository/movie_repository.dart';

class GetSearchMovieBloc {
  MovieRepository movieRepository = MovieRepository();
  BehaviorSubject<SearchMovieModel> behaviorSubject =
      BehaviorSubject<SearchMovieModel>();

  getSearchMovies(var query) async {
    SearchMovieModel searchMovieModel =
        await movieRepository.getSearchMovie(query);
    behaviorSubject.sink.add(searchMovieModel);
  }

  dispose() {
    behaviorSubject.close();
  }

  BehaviorSubject<SearchMovieModel> get subject => behaviorSubject;
}

final getSearchedBloc = GetSearchMovieBloc();
