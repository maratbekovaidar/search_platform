import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dsplatform/constants/api/api_path.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links/uni_links.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Authenticator {

  Authenticator({required this.webViewController});

  StreamSubscription? _sub;

  final WebViewController webViewController;

  final authorizationEndpoint = Uri.parse('${ApiPath.apiPath}/oauth2/authorize');
  final tokenEndpoint = Uri.parse('${ApiPath.apiPath}/oauth2/token');

  static const identifier = 'search-platform-client';
  static const secret = 'search-platform-secret';

  final redirectUrl = Uri.parse('https://search-platform-front.vercel.app/auth_code');
  final credentialsFile = File('credentials.json');

  Future<oauth2.Client> createClient() async {
    var exists = await credentialsFile.exists();

    if (exists) {
      var credentials = oauth2.Credentials.fromJson(await credentialsFile.readAsString());
      return oauth2.Client(credentials, identifier: identifier, secret: secret);
    }

    var grant = oauth2.AuthorizationCodeGrant(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      secret: secret,
    );

    var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);

    log("Redirect to authorizationUrl");
    // await redirect(authorizationUrl);
    webViewController.loadRequest(authorizationUrl);
    log("Start listening");
    var responseUrl = await listen(redirectUrl);
    log(responseUrl.toString());
    return grant.handleAuthorizationResponse(responseUrl!.queryParameters);
  }



  Future<Uri?> listen(Uri redirectUrl) async {
    log("Start listening in listener");
    final Completer<Uri> c = Completer<Uri>();
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onUrlChange: (urlChange) {
          if(urlChange.url!.startsWith(redirectUrl.toString())) {
            log(urlChange.url.toString());
            c.complete(Uri.parse(urlChange.url!));
          }
        }
      )
    );
    return c.future;
    /// https://search-platform-front.vercel.app/auth_code?code=u-mh-G-C4siXMigU10lXrvfRNqLfFeJzmLnHOEmvvJtLFaRmGYJaq6FR7y5DIHOIJKQl_RXWQcICaVZCZhWy6w9i8yG7XoHwiRoJXtwOoptLXDB3oucfGbGnynd9PufS
  }

  Future redirect(Uri authorizationUrl) async {
    await launchUrl(authorizationUrl); }

}