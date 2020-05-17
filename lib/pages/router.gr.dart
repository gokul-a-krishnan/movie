// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/movie_page.dart';
import 'package:movie/model/movie.dart';

abstract class Routes {
  static const homePage = '/';
  static const moviePage = '/movie-page';
  static const all = {
    homePage,
    moviePage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(),
          settings: settings,
        );
      case Routes.moviePage:
        if (hasInvalidArgs<MoviePageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<MoviePageArguments>(args);
        }
        final typedArgs = args as MoviePageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => MoviePage(typedArgs.movie),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//MoviePage arguments holder class
class MoviePageArguments {
  final Movie movie;
  MoviePageArguments({@required this.movie});
}
