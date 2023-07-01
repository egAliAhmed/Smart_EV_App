import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final String url = 'http://80.211.131.112:1880/ui';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child :WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
