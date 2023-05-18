import 'dart:async';
import 'dart:developer';

import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:webview_flutter/webview_flutter.dart';

class Authenticator {

  Authenticator({required this.webViewController});

  /// Client
  oauth2.Client? _client;
  /// Web controller, used for redirect url when then listened
  final WebViewController webViewController;

  /// Getters
  /// Get client
  oauth2.Client? get client => _client;
  /// Get credentials
  oauth2.Credentials get credentials => _client!.credentials;

  /// Authorization endpoint
  final authorizationEndpoint = Uri.parse('${ApiPath.apiPath}/oauth2/authorize');
  /// Token endpoint
  final tokenEndpoint = Uri.parse('${ApiPath.apiPath}/oauth2/token');
  /// Redirect url
  final redirectUrl = Uri.parse('https://search-platform-front.vercel.app/auth_code');

  /// Client identifier
  static const identifier = 'search-platform-client';
  /// Client secret
  static const secret = 'search-platform-secret';

  /// Create client method
  Future<oauth2.Client> createClient() async {

    /// Get client credentials form secure storage
    String? credentialsJson = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey);
    if (credentialsJson != null) {
      /// If credentials exits
      var credentials = oauth2.Credentials.fromJson(credentialsJson);
      if(credentials.tokenEndpoint.toString().startsWith(ApiPath.apiPath)) {
        /// Initialize client from credentials
        _client = oauth2.Client(credentials, identifier: identifier, secret: secret);
        try {
          _client = await _client!.refreshCredentials().whenComplete(() => log("Token refreshed"));
        } on Exception catch(e, _) {
          log(e.toString(), name: "Expired credentials");
          rethrow;
        }
        return _client!;
      }
    }

    /// If credentials from secure storage doesn't exist
    /// start authorize by code grant. Initialize grant
    /// by [AuthorizationCodeGrant] with identifier.
    var grant = oauth2.AuthorizationCodeGrant(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      secret: secret,
    );

    /// Getting authorization url with parameters
    var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);


    /// Load authorization url in webview
    try {
      webViewController.loadRequest(authorizationUrl);
    } on Exception catch (e) {
      GetIt.I.get<AuthenticationBloc>().add(LoggedOut());
    }

    /// Listen when load redirect url
    var responseUrl = await _listen(redirectUrl);

    /// Get client credentials
    _client = await grant.handleAuthorizationResponse(responseUrl!.queryParameters);

    /// Save credentials to secure storage
    await const FlutterSecureStorage().write(key: AppSecureStorageKeys.tokenKey, value: _client!.credentials.toJson());

    /// Start auto refresh token
    _autoRefreshingStart();
    return _client!;
  }

  void _autoRefreshingStart(){
    Timer.periodic(const Duration(minutes: 14), (timer) {
      _client!.refreshCredentials().then((value) {
        _client = value;
      });
    });
  }

  Future<Uri?> _listen(Uri redirectUrl) async {
    final Completer<Uri> c = Completer<Uri>();
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onUrlChange: (urlChange) {
          if(urlChange.url != null && urlChange.url!.startsWith(redirectUrl.toString())) {
            log(urlChange.url.toString());
            c.complete(Uri.parse(urlChange.url!));
          }
        }
      )
    );
    return c.future;
  }

  /// Clear webview data
  Future<void> clearCookies() async {
    await webViewController.clearCache();
    await webViewController.clearLocalStorage();
  }

  /// Close client and logout
  Future<void> logout() async {
    if(client != null) {
      await client!.post(Uri.parse("${ApiPath.apiPath}/logout"));
      client!.close();
    }
  }

}