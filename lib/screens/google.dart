import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleScreen extends StatefulWidget {
  const GoogleScreen({super.key});

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> with AutomaticKeepAliveClientMixin {
  late WebViewController _webViewController;
  late Future<bool> _canGoBack;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse("https://www.google.com"))
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
          title: const Text("Google", style: TextStyle(color: Colors.black),),
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
