import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/custom/style.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/pages/movie_detail.dart';
import 'package:movie/viewmodels/movie_view_model.dart';



class MovieList extends StatelessWidget {

  final List<MovieViewModel> movies;
  final String type;

  MovieList({this.movies, this.type});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];

        return (this.type == null || this.type.trim() == "")
            ? new Column(
                children: <Widget>[

                  Card(
                    color: Style.primaryswatch,
                    elevation: 0.0,
                    child: new InkWell(
                      onTap: () {
                        print("Position" + index.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetails(movie)));
                      },
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 120,
                              minHeight: 160,
                              maxWidth: 120,
                              maxHeight: 160,
                            ),
                            child: Image.network(
                              movie.poster_path,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  padding:
                                      EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    movie.title,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: Style.title,
                                  ),
                                ),
                                new Container(
                                  padding:
                                      EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                                  child: new Text(
                                    movie.overview,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: Style.subtitle,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  (index != 0)
                      ? new Divider(
                    color: Colors.black12,
                    thickness: 2.0,
                  )
                      : new Container(),
                ],
              )
            : (this.movies[index]
                    .title
                    .toLowerCase()
                    .contains(this.type.toLowerCase()))
                ? new Column(
                    children: <Widget>[
                      Card(
                        color: Style.primaryswatch,
                        elevation: 0.0,
                        child: new InkWell(
                          onTap: () {
                            print("Position" + index.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetails(movie)));
                          },
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 120,
                                  minHeight: 160,
                                  maxWidth: 120,
                                  maxHeight: 160,
                                ),
                                child: Image.network(
                                  movie.poster_path,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 5.0, 0.0, 5.0),
                                      child: Text(
                                        movie.title,
                                        textAlign: TextAlign.start,
                                        style: Style.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    new Container(
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 5.0, 0.0, 5.0),
                                      child: new Text(
                                        movie.overview,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: Style.subtitle,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      (index != 0)
                          ? new Divider(
                        color: Colors.black12,
                        thickness: 2.0,
                      )
                          : new Container(),
                    ],
                  )
                : new Container();
      },
    );
  }
}
