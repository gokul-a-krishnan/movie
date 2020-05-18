import 'package:bloc/bloc.dart';
import 'package:movie/api/movies_api.dart';
import 'package:movie/bloc/movies/event.dart';
import 'package:movie/bloc/movies/state.dart';
import 'package:movie/model/movie.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  List<Movie> _movies;
  MoviesApi _moviesApi;

  MoviesBloc() {
    _movies = List<Movie>();
    _moviesApi = MoviesApi();
  }

  @override
  MoviesState get initialState => LoadingMovies();

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    yield LoadingMovies();
    await Future.delayed(Duration(milliseconds: 800));
    if (event is WatchNowEvent) {
      _movies = await _moviesApi.getNowPlaying();
    } else if (event is TrendingEvent) {
      _movies = await _moviesApi.getTrending();
    } else if (event is UpcomingEvent) {
      _movies = await _moviesApi.getUpcoming();
    } else if (event is TopRatedEvent) {
      _movies = await _moviesApi.getTopRated();
    } else if (event is PopularEvent) {
      _movies = await _moviesApi.getPopular();
    }
    yield MoviesLoadedState(_movies);
  }
}
