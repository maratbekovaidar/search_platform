import 'dart:developer';
import 'dart:io';
import 'package:dsplatform/components/extension/change_notifier_selector_extension.dart';
import 'package:dsplatform/configurations/di/di.dart';
import 'package:dsplatform/configurations/language_provider/language_local_provider.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/bloc/bloc.dart';
import 'package:dsplatform/features/authorization/screens/src/final_registration.dart';
import 'package:dsplatform/configurations/language_provider/language_local_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'configurations/configurations.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Widgets binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Initialize splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// Setup inversion of control
  setupIoc();

  /// Get language code
  String? languageCode = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.languageKey);
  if (languageCode != null) {
    /// Set Language
    GetIt.I.get<LanguageLocalProvider>().setLocale(Locale(languageCode));
    /// Initialize date formatting local
    // await initializeDateFormatting(languageCode);
  } else {
    /// Set system language
    GetIt.I.get<LanguageLocalProvider>().setLocale(Locale(Platform.localeName.substring(0, 2), Platform.localeName.substring(3, 5)));
    // await initializeDateFormatting(Platform.localeName);

  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final getIt = GetIt.I;
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = GetIt.I.get<AuthenticationBloc>();
    authenticationBloc.add(AppStarted());
    // authenticationBloc.add(LoggedOut());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<AuthorizationBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I.get<AuthenticationBloc>()..add(AppStarted()),
        ),
      ],
      child: ValueListenableBuilder<Locale>(
        valueListenable: getIt
            .get<LanguageLocalProvider>()
            .select<Locale>((cn) => cn.locale,
                (prev, next) => prev.languageCode != next.languageCode),
        builder: (context, locale, child) {

          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {


              /// Authentication uninitialized state
              if(state is AuthenticationUninitializedState) {
                return MaterialApp(
                  title: 'Alga App',
                  theme: AppTheme.basic,
                  debugShowCheckedModeBanner: false,
                  locale: locale,
                  home: const SplashScreen(),
                );
              }

              if(state is AuthenticationLoadingState) {
                return MaterialApp(
                  title: 'Alga App',
                  theme: AppTheme.basic,
                  debugShowCheckedModeBanner: false,
                  locale: locale,
                  home: const AuthenticateLoadingPage(),
                );
              }

              if(state is AuthenticationAuthenticatedState) {
                if(state.isUserFillProfile) {
                  return MaterialApp.router(
                    title: 'Alga App',
                    theme: AppTheme.basic,
                    debugShowCheckedModeBanner: false,
                    locale: locale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: AppLocalizations.supportedLocales,
                    routerConfig: AppRouter.returnRouter(true),
                  );
                } else {
                  return MaterialApp(
                    title: 'Alga App',
                    theme: AppTheme.basic,
                    debugShowCheckedModeBanner: false,
                    locale: locale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: AppLocalizations.supportedLocales,
                    home: const FinalRegistration(),
                  );
                }
              }

              if(state is AuthenticationUnauthenticatedState) {
                return MaterialApp.router(
                  title: 'Alga App',
                  theme: AppTheme.basic,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: locale,
                  routerConfig: AppRouter.returnRouter(false),
                  // routeInformationParser: AppRouter.returnRouter(false).routeInformationParser,
                  // routerDelegate: AppRouter.returnRouter(false).routerDelegate,
                );
              }

              return MaterialApp(
                title: 'Alga App',
                theme: AppTheme.basic,
                debugShowCheckedModeBanner: false,
                locale: const Locale("ru"),
                home: const ErrorPage(errorText: "Unimplemented state"),
              );
            },
          );
        }
      ),
    );
  }
}
