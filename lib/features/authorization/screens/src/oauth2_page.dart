import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OAuth2Page extends StatefulWidget {
  const OAuth2Page({Key? key}) : super(key: key);
  @override
  State<OAuth2Page> createState() => _OAuth2PageState();
}

class _OAuth2PageState extends State<OAuth2Page> {


  @override
  void initState() {
    super.initState();
    GetIt.I.get<Authenticator>().createClient().then((value) {
      GetIt.I.get<AuthenticationBloc>().add(LoggedIn());
    }).onError((error, stackTrace) {
      Navigator.pop(context);
      showNotificationWidget(context, "Invalid login credentials", NotificationWidgetType.error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: GetIt.I.get<Authenticator>().webViewController),
    );
  }
}
