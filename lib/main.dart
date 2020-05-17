import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movies/bloc.dart';
import 'package:movie/pages/router.gr.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(),
      child: MaterialApp(
        title: 'Movie',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator<Router>(router: Router()),
//      home: BlocProvider(
//        create: (BuildContext context) => MoviesBloc(),
//        child: HomePage(),
//      ),
      ),
    );
  }
}
