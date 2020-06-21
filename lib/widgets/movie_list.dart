import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie/custom/style.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/pages/movie_detail.dart';
import 'package:movie/viewmodels/movie_view_model.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;
  final String type;
  final Function(int) press;

  MovieList({this.movies, this.type, this.press});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];

        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            child: (this.type == null || this.type.trim() == "")
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
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 0.0, 0.0, 5.0),
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
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 5.0, 0.0, 0.0),
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
                      new Divider(
                        color: Colors.black12,
                        thickness: 1.0,
                      )
                    ],
                  )
                : (this
                        .movies[index]
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
                                        builder: (context) =>
                                            MovieDetails(movie)));
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.fromLTRB(
                                              5.0, 0.0, 0.0, 5.0),
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
                                              5.0, 5.0, 0.0, 0.0),
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
                          new Divider(
                            color: Colors.black12,
                            thickness: 1.0,
                          )
                        ],
                      )
                    : new Container(),
          ),
//          actions: <Widget>[
//            IconSlideAction(
//              caption: 'Archive',
//              color: Colors.blue,
//              icon: Icons.archive,
//              onTap: () {},
//            ),
//            IconSlideAction(
//              caption: 'Share',
//              color: Colors.indigo,
//              icon: Icons.share,
//              onTap: () {},
//            ),
//          ],
          secondaryActions: <Widget>[
//            IconSlideAction(
//              caption: 'More',
//              color: Colors.black45,
//              icon: Icons.more_horiz,
//              onTap: () => {},
//            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => {this.press(index)},
            ),
          ],
        );
      },
    );
  }
}
