import 'package:dsplatform/configurations/di/bootstrapper/src/bloc_bootstrapper.dart';
import 'package:dsplatform/configurations/di/bootstrapper/src/repository_bootstrapper.dart';
import 'package:dsplatform/configurations/language_provider/language_bootstrapper.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Setup Inversion of control
Future<void> setupIoc() async {

  /// Init GetIt
  final getIt = GetIt.I;

  /// TODO@Feature: caching
  /// await initCache(getIt);

  /// Call init repositories
  await initRepositories(getIt);
  /// Call init blocs
  await initBloc(getIt);
  /// Call  init languages
  await initLanguage(getIt);

  /// Register singleton
  getIt.registerSingleton(WebViewController()..setNavigationDelegate(
    NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) {
        print('onNavigationRequest');
        //I first had this line to prevent redirection to anywhere on the internet via hrefs
        //but this prevented ANYTHING from being displayed
        // return NavigationDecision.prevent;

        return NavigationDecision.navigate; //changed it to this, and it works now
      },
    )
  ));

  /// Register authenticator
  getIt.registerSingleton(Authenticator(webViewController: getIt.get<WebViewController>()));
}