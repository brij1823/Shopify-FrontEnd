import 'package:dio/dio.dart';
import 'package:shopify/models/movie_response.dart';
import 'package:shopify/models/search_movie_model.dart';

class MovieRepository {
  final String apiKey = "ca901ac5b1b28b9b7ad2ba20c412abb4";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio dio = Dio();
  var getPlayingUrl = '$mainUrl/movie/now_playing';

  String omdbURL = "http://www.omdbapi.com/";
  String omdbKey = "521f974e";

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};

    try {
      Response response = await dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error) {
      return MovieResponse.withError('$error');
    }
  }

  Future<SearchMovieModel> getSearchMovie(var query) async {
    var params = {
      "apikey": omdbKey,
      "t": query,
      "Access-Control-Allow-Credentials": true,
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
    };
    try {
      Response response = await dio.get(omdbURL, queryParameters: params);
      return SearchMovieModel.fromJson(response.data);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
