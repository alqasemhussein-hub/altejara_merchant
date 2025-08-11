import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:techara_merchant/src/core/const/variable.dart';

class PaymentInAppWebViewScreen extends StatefulWidget {
  final String url;
  final String title;
  const PaymentInAppWebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<PaymentInAppWebViewScreen> createState() =>
      _PaymentInAppWebViewScreenState();
}

class _PaymentInAppWebViewScreenState extends State<PaymentInAppWebViewScreen> {
  late InAppWebViewController _webViewController;
  double progress = 0;
  bool isLoading = false;
  String? status;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3.0),
          child: isLoading && progress < 1.0
              ? LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                )
              : Container(),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            useShouldOverrideUrlLoading: true,
          ),
          android: AndroidInAppWebViewOptions(useHybridComposition: true),
          ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onProgressChanged: (controller, progressValue) {
          progress = progressValue / 100;
          isLoading = progress < 1.0;
          setState(() {});
        },
        onLoadStart: (controller, url) {
          isLoading = true;
          setState(() {});
        },
        onLoadStop: (controller, url) async {
          isLoading = false;
          setState(() {});
        },
        onLoadError: (controller, url, code, message) {
          isLoading = false;
          setState(() {});
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final url = navigationAction.request.url;
          if (url == null) {
            return NavigationActionPolicy.ALLOW;
          }

          final urlStr = url.toString();
          status = url.queryParameters['status'] ?? status;
          if (urlStr.startsWith('https://tajr.gcc.iq')) {
            if (status == 'payment_declined') {
              navigatorKey.currentState?.pop(false);
            } else {
              navigatorKey.currentState?.pop(true);
            }

            return NavigationActionPolicy.CANCEL;
          }

          return NavigationActionPolicy.ALLOW;
        },
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          return ServerTrustAuthResponse(
            action: ServerTrustAuthResponseAction.PROCEED,
          );
        },
      ),
    );
  }
}
