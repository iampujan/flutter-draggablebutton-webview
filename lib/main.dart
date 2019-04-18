import 'dart:io';

import 'package:flutter/material.dart';
import 'package:draggable_floating_button/draggable_floating_button.dart';
import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EEE',
      home: new MyHomePage(title: 'Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppBar appBar;
  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    appBar = getAppBar();

    return Scaffold(
        appBar: appBar,
        body: Stack(children: <Widget>[
          Home(),
          DraggableFloatingActionButton(
              data: 'dfab_demo',
              offset: new Offset(100, 100),
              backgroundColor: Theme.of(context).accentColor,
              child: new Icon(
                Icons.wb_incandescent,
                color: Colors.yellow,
              ),

              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Do you really want to quit the app?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("No"),
                              onPressed: () => Navigator.pop(context, false),
                            ),
                            FlatButton(
                              child: Text("Yes"),
                              onPressed: (){exit(0);}
                            ),
                          ],
                        ));
              },
             appContext: context,
              appBar: appBar
             )
        ]));
  }


  getAppBar() {
    return AppBar(
      title: Text(widget.title),
    );
  }
}