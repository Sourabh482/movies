import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;

  CustomDialog({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return dialogContent(context);
  }

  dialogContent(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(
            key: key,
            elevation: 0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              new Center(
                  child: new Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                child: Column(children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  new Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                  Text(
                    "Loading...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                  )
                ]),
              ))
            ]));
  }
}
