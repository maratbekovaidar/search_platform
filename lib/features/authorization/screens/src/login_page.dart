import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/authorization/bloc/bloc.dart';
import 'package:dsplatform/features/authorization/screens/src/oauth2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool recovery = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if(state is AuthorizationFailureState) {
          showNotificationWidget(
            context,
            AppLocalizations.of(context)!.login_failure,
            NotificationWidgetType.error,
          );
          setState(() {
            recovery = true;
          });
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 200),

                  /// Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.app_name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  /// Login button
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OAuth2Page()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login
                          ),
                        )
                      )
                    ],
                  ),

                  /// Sign up
                  recovery ?         /// Password Recovery
                  TextButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed(AppRouteConstants.passwordRecoveryRoteName);
                      },
                      child: const Text(
                        "Восстановить пароль",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ) :
                  TextButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed(AppRouteConstants.registrationRoteName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.registration,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),

                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
