import 'dart:developer';

import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/constants/api/api_path.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class OAuth2Page extends StatefulWidget {
  const OAuth2Page({Key? key}) : super(key: key);
  @override
  State<OAuth2Page> createState() => _OAuth2PageState();
}

class _OAuth2PageState extends State<OAuth2Page> {

  late WebViewController _webViewController;
  late Authenticator _authenticator;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000));
    _authenticator = Authenticator(webViewController: _webViewController);
    _authenticator.createClient().then((value) {
      log(value.credentials.accessToken, name: "Access token");
      log(value.credentials.refreshToken.toString(), name: "Refresh token");
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
