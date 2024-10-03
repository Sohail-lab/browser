import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YouTubeScreen extends StatefulWidget {
  const YouTubeScreen({super.key});

  @override
  State<YouTubeScreen> createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> with AutomaticKeepAliveClientMixin{
  late WebViewController _webViewController;
  late Future<bool> _canGoBack;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse("https://www.youtube.com"))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    _canGoBack = _webViewController.canGoBack();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        final canGoBack = await _webViewController.canGoBack();
        if(canGoBack) {
          _webViewController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("YouTube", style: TextStyle(color: Colors.black),),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: WebViewWidget(controller: _webViewController),
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
