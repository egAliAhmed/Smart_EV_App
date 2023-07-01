import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String url = 'http://80.211.131.112:1880/ui';
  bool _showImage = true;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      setState(() {
        _showImage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Offstage(
              offstage: _showImage,
              child: WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) {
                  if (!request.url.startsWith('http://80.211.131.112:1880/ui')) {                      
                    _launchURL(request.url); // Open external links in the browser                        
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            ),
            if (_showImage)
              Image.asset(
                'images/start.gif', // Replace with the actual path and filename of your image
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
          ],
        ),
      ),
    );
  }
}
