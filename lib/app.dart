import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.havePinCode}) : super(key: key);

  final bool havePinCode;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // You can check if the app has permission here as well, instead of
      // checking if the dialog is displayed or not
      if (await const FlutterSecureStorage().read(key: AppSecureStorageKeys.pinCodeKey) == null) {
        _showDialog();
      }
    });
  }

  void _showDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      }
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // print(state);
      // print("Show pin code");
      // Navigator.push(
      //   navigatorKey.currentContext!,
      //   MaterialPageRoute(
      //     builder: (_) => const PinCodePage(),
      //   ),
      // );
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: navigatorKey,
      title: 'DSPlatform',
      theme: AppTheme.basic,
      debugShowCheckedModeBanner: false,
      locale: const Locale("ru"),
      routerConfig: AppRouter.returnRouter(true),
      // routeInformationParser: AppRouter.returnRouter(false).routeInformationParser,
      // routerDelegate: AppRouter.returnRouter(false).routerDelegate,
    );
  }
}
