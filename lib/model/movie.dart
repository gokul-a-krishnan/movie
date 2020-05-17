class Movie {
  final int id;
  final String originalTitle;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final String backdropPath;

  Movie(this.id, this.originalTitle, this.posterPath, this.overview,
      this.releaseDate, this.backdropPath);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'original_title': this.originalTitle,
      'poster_path': this.posterPath,
      'overview': this.overview,
      'release_date': this.releaseDate,
      'backdrop_path': this.backdropPath,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie.name(
      map['id'] as int,
      map['original_title'] as String,
      map['poster_path'] as String,
      map['overview'] as String,
      map['release_date'] as String,
      map['backdrop_path'] as String,
    );
  }

  Movie.name(this.id, this.originalTitle, this.posterPath, this.overview,
      this.releaseDate, this.backdropPath);
}
