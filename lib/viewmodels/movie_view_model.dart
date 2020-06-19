

import 'package:movie/models/movie.dart';

class MovieViewModel {

  final Movie movie;

  MovieViewModel({this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.poster;
  }

  bool get adult {
    return this.movie.adult;
  }
  String get backdrop_path {
    return this.movie.backdrop_path;
  }
  List<int> get genre_ids {
    return this.movie.genre_ids;
  }
  int get id {
    return this.movie.id;
  }
  String get original_language {
    return this.movie.original_language;
  }
  String get original_title {
    return this.movie.original_title;
  }
  String get overview {
    return this.movie.overview;
  }
  double get popularity {
    return this.movie.popularity;
  }
  String get poster_path {
    return this.movie.poster_path;
  }
  String get release_date {
    return this.movie.release_date;
  }
  bool get video {
    return this.movie.video;
  }
  double get vote_average {
    return this.movie.vote_average;
  }
  int get vote_count {
    return this.movie.vote_count;
  }





}