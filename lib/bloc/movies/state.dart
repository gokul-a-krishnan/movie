import 'package:movie/model/movie.dart';

abstract class MoviesState {}

class LoadingMovies extends MoviesState {}

class MoviesLoadedState extends MoviesState {
  final List<Movie> movies;

  MoviesLoadedState(this.movies);
}
