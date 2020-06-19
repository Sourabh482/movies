import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/custom/style.dart';
import 'package:movie/pages/home.dart';
import 'package:movie/pages/movie_list_page.dart';
import 'package:movie/viewmodels/movie_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies",
        theme: new ThemeData(
            primarySwatch: Style.primaryswatch,
            brightness: Style.brightness,
            accentColor: Style.accentcolor,
            primaryColor: defaultTargetPlatform == TargetPlatform.iOS
                ? Colors.white
                : Style.accentcolor),
        home: HomeDart());
  }
}
