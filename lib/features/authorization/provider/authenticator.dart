import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:dsplatform/constants/api/api_path.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links/uni_links.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:crypto/crypto.dart';

class Authenticator {

  Authenticator({required this.webViewController});

  StreamSubscription? _sub;

  final WebViewController webViewController;

  final authorizationEndpoint = Uri.parse('${ApiPath.apiPath}/oauth2/authorize');
  final tokenEndpoint = Uri.parse('${ApiPath.apiPath}/oauth2/token');
  final loginEndPoint = Uri.parse('${ApiPath.apiPath}/login');

  static const identifier = 'search-platform-client';
  static const secret = 'search-platform-secret';

  final redirectUrl = Uri.parse('https://search-platform-front.vercel.app/auth_code');
  final credentialsFile = File('credentials.json');



  static const String _charset =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

  static String _createCodeVerifier() => List.generate(
    128,
        (i) => _charset[Random.secure().nextInt(_charset.length)],
  ).join();


  Uri _addQueryParameters(Uri url, Map<String, String> parameters) => url.replace(
      queryParameters: Map.from(url.queryParameters)..addAll(parameters));

  String _basicAuthHeader(String identifier, String secret) {
    var userPass = '${Uri.encodeFull(identifier)}:${Uri.encodeFull(secret)}';
    return 'Basic ${base64Encode(ascii.encode(userPass))}';
  }

  Future<String> createClient() async {
    // var exists = await credentialsFile.exists();
    //
    // if (exists) {
    //   var credentials = oauth2.Credentials.fromJson(await credentialsFile.readAsString());
    //   return oauth2.Client(credentials, identifier: identifier, secret: secret);
    // }
    //
    // var grant = oauth2.AuthorizationCodeGrant(
    //   identifier,
    //   authorizationEndpoint,
    //   tokenEndpoint,
    //   secret: secret,
    // );
    webViewController.clearCache();
    // var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);


    String codeVerifier = _createCodeVerifier();
    dev.log(codeVerifier, name: "Code verifier");
    var codeChallenge = base64Url
        .encode(sha256.convert(ascii.encode(codeVerifier)).bytes)
        .replaceAll('=', '');
    dev.log(codeChallenge, name: "Code challenge");

    var parameters = {
      'response_type': 'code',
      'client_id': 'search-platform-client',
      'redirect_uri': 'https://search-platform-front.vercel.app/auth_code',
      'code_challenge': codeChallenge,
      'code_challenge_method': 'S256',
      'state': 'state'
    };

    /// Uri _addQueryParameters(Uri url, Map<String, String> parameters) => url.replace(
    ///     queryParameters: Map.from(url.queryParameters)..addAll(parameters));
    Uri authorizationUrl = _addQueryParameters(authorizationEndpoint, parameters);
    print(codeChallenge);

    // await redirect(authorizationUrl);
    webViewController.loadRequest(authorizationUrl);
    var responseUrl = await listen(redirectUrl);

    var body = {
      'grant_type': 'authorization_code',
      'code': responseUrl!.queryParameters['code'],
      'redirect_uri': redirectUrl.toString(),
      'code_verifier': codeVerifier
    };

    var header = {
      'Authorization': _basicAuthHeader(identifier, secret)
    };

    var response = await http.post(tokenEndpoint, headers: header, body: body);
    print(response.headers);
    print(response.statusCode);
    return jsonDecode(response.body)['access_token'];
    // return grant.handleAuthorizationResponse(responseUrl!.queryParameters);
  }



  Future<Uri?> listen(Uri redirectUrl) async {
    // log("Start listening in listener");
    final Completer<Uri> c = Completer<Uri>();
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onUrlChange: (urlChange) {
          if(urlChange.url!.startsWith(redirectUrl.toString())) {
            // log(urlChange.url.toString());
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


  showCode() {
    String codeVerifier = _createCodeVerifier();
    dev.log(codeVerifier, name: "Code verifier");
    var codeChallenge = base64Url
        .encode(sha256.convert(ascii.encode(codeVerifier)).bytes)
        .replaceAll('=', '');
    dev.log(codeChallenge, name: "Code challenge");

  }

  clearCache() {
    webViewController.clearCache();
    webViewController.clearLocalStorage();
  }
}