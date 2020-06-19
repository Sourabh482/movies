import 'package:flutter/material.dart';
import 'package:movie/custom/style.dart';
import 'package:movie/viewmodels/movie_list_view_model.dart';
import 'package:provider/provider.dart';

import 'movie_list_page.dart';

class HomeDart extends StatefulWidget {
  @override
  _HomeDartState createState() => _HomeDartState();
}

class _HomeDartState extends State<HomeDart>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          ChangeNotifierProvider(
            create: (context) => MovieListViewModel(),
            child: MovieListPage("normal"),
          ),
          ChangeNotifierProvider(
            create: (context) => MovieListViewModel(),
            child: MovieListPage("top"),
          )
        ],
      ),
      bottomNavigationBar: new Material(
        color: Style.primaryswatch,
        elevation: 8,
        child: new TabBar(
            controller: tabController,
            indicatorColor: Colors.grey,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              new Tab(
                icon: (tabController.index == 0)
                    ? new Image.asset(
                        "assets/playing.png",
                        height: 30,
                        width: 30,
                      )
                    : new Image.asset(
                        "assets/playing1.png",
                        height: 30,
                        width: 30,
                      ),
                child: new Text(
                  "Now Playing",
                  style: (tabController.index == 0)
                      ? Style.tabtextselect
                      : Style.tabtextunselect,
                ),
              ),
              new Tab(
                  icon: new Icon(Icons.star_border,
                      size: 35.0,
                      color: (tabController.index == 1)
                          ? Colors.black
                          : Colors.grey),
                  child: new Text(
                    "Top Rated",
                    style: (tabController.index == 1)
                        ? Style.tabtextselect
                        : Style.tabtextunselect,
                  )),
            ]),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
