import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
class WebScreen extends StatefulWidget {
  const WebScreen({super.key});
  static const String route = 'web';

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {

  final String linc = 'https://pagbeting.space/QN9Kbb';
  final String GAID = '6a3ff855-11a9-4702-b861-c6bbd4dd30da';
  final String token = 'ee1fOXnASpeBy75wDa9AEk:APA81bE411bx_KPYogvBP-3vhYO5LNYyDy6k9C6FbJyvGfyv_VZwX3hI2TkvzHXejEB-k40B06lVaaXHEc6N-aX8Z15HNooNa0_hxOMj1gmMJWmYzsbqP0I8BXjaLyS0vrFrQo8GGiqo';
  final String name = 'Ivan_Ivanov';

  late InAppWebViewController _webViewController;
  double progress = 0;

  Future<bool> onBackPressed() async {
    if (await _webViewController.canGoBack()) {
      _webViewController.goBack();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    String url = '$linc?gaid=$GAID&token=$token&name=$name';
    return WillPopScope(
      onWillPop: () async => onBackPressed(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(url)),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    useShouldOverrideUrlLoading: true,
                    javaScriptCanOpenWindowsAutomatically: true,
                  ),
                ),
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                androidOnPermissionRequest:
                    (InAppWebViewController controller, String origin,
                    List<String> resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                },
                onProgressChanged: (controller, progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
              progress < 1.0
                  ? const Center(child: CircularProgressIndicator(
                color: Colors.amber,
                  strokeWidth: 18))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
