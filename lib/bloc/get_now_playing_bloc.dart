import 'package:rxdart/rxdart.dart';
import 'package:shopify/models/movie_response.dart';
import 'package:shopify/repository/movie_repository.dart';

class GetNowPlayingBloc {
  MovieRepository movieRepository = MovieRepository();
  BehaviorSubject<MovieResponse> behaviorSubject =
      BehaviorSubject<MovieResponse>();

  getNowplaying() async {
    MovieResponse movieResponse = await movieRepository.getPlayingMovies();
    behaviorSubject.sink.add(movieResponse);
  }

  dispose() {
    behaviorSubject.close();
  }

  BehaviorSubject<MovieResponse> get subject => behaviorSubject;
}

final getPlayingBloc = GetNowPlayingBloc();
