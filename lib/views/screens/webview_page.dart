import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String articleLink;

  WebViewPage(this.articleLink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: WebView(
        initialUrl: articleLink,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
