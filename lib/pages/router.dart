import 'package:auto_route/auto_route_annotations.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/movie_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomePage homePage;
  MoviePage moviePage;
}
//flutter packages pub run build_runner build
