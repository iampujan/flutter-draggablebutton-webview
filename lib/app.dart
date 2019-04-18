import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:async';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

String url = "https://youtube.com/";

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final webView = FlutterWebviewPlugin();
  TextEditingController controller = TextEditingController(text: url);

  @override
  void initState() {
    super.initState();

    webView.close();
    controller.addListener(() {
      url = controller.text;
    });
  }

  @override
  void dispose() {
    webView.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://youtube.com",
        javascriptMode: JavascriptMode.unrestricted,
      )
        // body: Center(
        //   child: Column(
        //     children: <Widget>[
        //       Container(
        //         padding: EdgeInsets.all(10.0),
        //         child: TextField(
        //           controller: controller,
        //         ),
        //       ),
        //       RaisedButton(
        //         onPressed: () {
        //           Navigator.of(context).pushNamed("/webview");
        //         },
        //       )
        //     ],
        //   ),
        // )
        );
  }
}