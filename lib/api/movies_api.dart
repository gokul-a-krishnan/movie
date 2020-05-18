import 'package:dio/dio.dart';
import 'package:movie/model/movie.dart';

class MoviesApi {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  final String _apiKey = 'YOUR_API_KEY';

  final String _nowPlayingPath = '/movie/now_playing';
  final String _popularPath = '/movie/popular';
  final String _topRatedPath = '/movie/top_rated';
  final String _upcomingPath = '/movie/upcoming';
  final String _trendingPath = '/trending/all/week';

  final Dio _dio = Dio();

  Future<List<Movie>> getNowPlaying() async {
    _dio.options.baseUrl = _baseUrl;
    Response response = await _dio.get(_nowPlayingPath, queryParameters: {
      'api_key': _apiKey,
    });
    return _transformResult(response);
  }

  Future<List<Movie>> getPopular() async {
    _dio.options.baseUrl = _baseUrl;
    Response response = await _dio.get(_popularPath, queryParameters: {
      'api_key': _apiKey,
    });
    return _transformResult(response);
  }

  Future<List<Movie>> getTrending() async {
    _dio.options.baseUrl = _baseUrl;
    Response response = await _dio.get(_trendingPath, queryParameters: {
      'api_key': _apiKey,
    });
    return _transformResult(response);
  }

  Future<List<Movie>> getTopRated() async {
    _dio.options.baseUrl = _baseUrl;
    Response response = await _dio.get(_topRatedPath, queryParameters: {
      'api_key': _apiKey,
    });
    return _transformResult(response);
  }

  Future<List<Movie>> getUpcoming() async {
    _dio.options.baseUrl = _baseUrl;
    Response response = await _dio.get(_upcomingPath, queryParameters: {
      'api_key': _apiKey,
    });
    return _transformResult(response);
  }

  Future<List<Movie>> getRecommendation(int id) async {
    String recommendationPath = _baseUrl + '/movie/$id/recommendations';
    _dio.options.baseUrl = _baseUrl;
    Response response = await _dio.get(recommendationPath, queryParameters: {
      'api_key': _apiKey,
    });
    return _transformResult(response);
  }

  Future<List<Movie>> _transformResult(Response response) async {
    List data = response.data['results'];
    List<Movie> movies = List<Movie>();
    data.forEach((element) {
      element['poster_path'] = _imageBaseUrl + element['poster_path'];
      if (element['backdrop_path'] != null)
        element['backdrop_path'] = _imageBaseUrl + element['backdrop_path'];
      else {
        element['backdrop_path'] = 'https://via.placeholder.com/150';
      }
      movies.add(Movie.fromMap(element));
    });
    return movies;
  }
}
