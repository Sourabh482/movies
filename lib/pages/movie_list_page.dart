import 'package:flutter/material.dart';
import 'package:movie/custom/customdialog.dart';
import 'package:movie/custom/style.dart';
import 'package:movie/viewmodels/movie_list_view_model.dart';
import 'package:movie/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  String type;

  @override
  _MovieListPageState createState() => _MovieListPageState();

  MovieListPage(this.type);
}

class _MovieListPageState extends State<MovieListPage>
    with AutomaticKeepAliveClientMixin<MovieListPage> {
  final TextEditingController _controller = TextEditingController();
  var random;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final scaffoldkey = new GlobalKey<ScaffoldState>();
  MovieListViewModel vm;
  Widget appBarTitle = new Text(
    "Movies",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  String filter = "";

  @override
  void initState() {
    super.initState();
    loading();
    _controller.addListener(() {
      setState(() {
        filter = _controller.text;
      });
    });
    // you can uncomment this to get all batman movies when the page is loaded
    //Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("batman");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> loading() async {
    await Future.delayed(Duration(milliseconds: 0));
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(title: "loading"),
    );
    await Future.delayed(Duration(milliseconds: 1000));
    vm = await Provider.of<MovieListViewModel>(context);
    vm.fetchMovies(widget.type);
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
    Navigator.of(context, rootNavigator: false).pop();
    return null;
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(milliseconds: 0));
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(title: "loading"),
    );
    await Future.delayed(Duration(milliseconds: 1000));
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    vm = Provider.of<MovieListViewModel>(context);
    //vm.fetchMovies(widget.type);
    vm.fetchMovies(widget.type);
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
    Navigator.of(context, rootNavigator: false).pop();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(context),
      key: scaffoldkey,
      body: RefreshIndicator(
        key: refreshKey,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              color: Style.primaryswatch,
            ),
            child: Column(children: <Widget>[
              Expanded(
                  child: (vm != null)
                      ? MovieList(movies: vm.movies, type: _controller.text)
                      : new Container())
            ])),
        onRefresh: refreshList,
      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: new Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(
              const Radius.circular(120.0),
            ),
          ),
          child: new TextField(
            controller: _controller,
            style: new TextStyle(
              color: Colors.black45,
            ),
            decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search, color: Colors.black45),
              hintText: "Search...",
              hintStyle: new TextStyle(color: Colors.black45),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ));
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Movies",
        style: new TextStyle(color: Colors.white),
      );
      _controller.clear();
    });
  }

  Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    new Center(
                        child: new Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        new Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                        Text(
                          "Please Wait....",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.normal),
                        )
                      ]),
                    ))
                  ]));
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
