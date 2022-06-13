import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatelessWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () async {},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () async {},
          ),
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () {},
          ),
        ],
      ),
      body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://flutter.dev'
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan, size: 32),
        onPressed: () async {},
      ),
    );
  }
}
