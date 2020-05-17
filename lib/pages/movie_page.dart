import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/api/movies_api.dart';
import 'package:movie/model/movie.dart';
import 'package:movie/pages/router.gr.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;

  MoviePage(this.movie);

  @override
  Widget build(BuildContext context) {
    Future<List<Movie>> futureMovies = MoviesApi().getRecommendation(movie.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.originalTitle),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                movie.backdropPath,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 8.0, 8.0, 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Title:  ${movie.originalTitle} \nRelease: ${movie.releaseDate}',
                    softWrap: true,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Overview:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 8.0, 8.0),
                child: Text(
                  movie.overview,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
                child: Text(
                  'Also Watch:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: futureMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      List<Movie> movies = snapshot.data;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => ExtendedNavigator.of(context).pushNamed(
                            Routes.moviePage,
                            arguments: MoviePageArguments(
                              movie: movies[index],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              movies[index].posterPath,
                              height: 75,
                            ),
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: Text('No Recommendation'),
                    );
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 100.0, 8.0, 8.0),
              child: Image.network(
                movie.posterPath,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
