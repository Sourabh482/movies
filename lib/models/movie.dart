class Movie {
  final bool adult;
  final String backdrop_path;
  final List<int> genre_ids;
  final String poster;
  final int id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;

  Movie(
      {this.adult,
      this.backdrop_path,
      this.genre_ids,
      this.poster,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json["adult"],
      backdrop_path: "https://image.tmdb.org/t/p/original"+json["backdrop_path"],
      genre_ids: json["genre_ids"].cast<int>(),
      poster: json["poster"],
      id: json["id"],
      original_language: json["original_language"],
      original_title: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]*1.0,
      poster_path: "https://image.tmdb.org/t/p/w342/"+json["poster_path"],
      release_date: json["release_date"],
      title: json["title"],
      video: json["video"],
      vote_average: json["vote_average"]*1.0,
      vote_count: json["vote_count"]
    );
  }
}
