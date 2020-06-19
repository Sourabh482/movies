
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/custom/customdialog.dart';
import 'package:movie/custom/style.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/viewmodels/movie_view_model.dart';

class MovieDetails extends StatefulWidget {
  MovieViewModel movie;

  MovieDetails(this.movie);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }

  void ExpandDetails() {
    if (isExpanded) {
      setState(() {
        isExpanded = false;
      });
    } else {
      setState(() {
        isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(),
        body: new Container(
            decoration: new BoxDecoration(color: Style.primaryswatch),
            child: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new CachedNetworkImageProvider(widget.movie.backdrop_path),
                  fit: BoxFit.cover,
                ),
              ),
              child: new Container(
                alignment: Alignment.bottomCenter,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                        width: double.maxFinite,
                        margin:
                            const EdgeInsets.fromLTRB(30.0, 00.0, 30.0, 0.0),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          border: Border.all(color: Colors.black12),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(0.0),
                          ),
                        ),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.topLeft,
                              child: new Text(
                                widget.movie.title,
                                style: Style.detailtitle,
                              ),
                            ),
                            new Container(
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.topLeft,
                              child: new Text(
                                widget.movie.release_date,
                                style: Style.detaildate,
                              ),
                            ),
                            new Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                new Row(
                                  children: <Widget>[
                                    new Image.asset(
                                      "assets/crown.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    Padding(padding: EdgeInsets.all(4.0)),
                                    new Text(
                                      widget.movie.vote_average.toString() +
                                          " %",
                                      style: Style.rating,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            (isExpanded)
                                ? new Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.topLeft,
                                    child: new Text(
                                      widget.movie.overview,
                                      style: Style.overview,
                                    ),
                                  )
                                : new Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.topLeft,
                                    child: new Text(
                                      widget.movie.overview,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      style: Style.overview,
                                    ),
                                  ),
                            new Container(
                                alignment: Alignment.topRight,
                                child: new Container(
                                  padding: EdgeInsets.all(3),
                                  margin: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(2.0),
                                    ),
                                  ),
                                  child: new InkWell(
                                    onTap: () {
                                      ExpandDetails();
                                    },
                                    child: (isExpanded)
                                        ? new Text(
                                            "See Less",
                                            style: Style.more,
                                          )
                                        : new Text(
                                            "See more",
                                            style: Style.more,
                                          ),
                                  ),
                                ))
                          ],
                        ))
                  ],
                ),
              ),
            )));
  }

  void loadImage()async {
    await Future.delayed(Duration(milliseconds: 0));
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(title: "loading"),
    );
    await Future.delayed(Duration(milliseconds: 3000));
    setState(() {});
    Navigator.of(context, rootNavigator: false).pop();
  }
}
