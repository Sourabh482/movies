import 'package:flutter/material.dart';
import 'package:movie/services/webservice.dart';

import 'movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {


  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<void> fetchMovies(String type) async {
    final results =  await Webservice().fetchMovies(type);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    //print(this.movies);
    notifyListeners();
  }

}