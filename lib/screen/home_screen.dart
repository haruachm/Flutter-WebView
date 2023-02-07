import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HwanE Blog'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: WebView(
        initialUrl: 'https://parkjh7764.tistory.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
