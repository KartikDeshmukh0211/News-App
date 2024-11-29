import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewScreen extends StatefulWidget {
  const ArticleViewScreen({super.key, required this.url});
  final String url;

  @override
  State<ArticleViewScreen> createState() => _ArticleViewScreenState();
}

class _ArticleViewScreenState extends State<ArticleViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News"),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
