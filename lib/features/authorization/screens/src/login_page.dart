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

                  // /// Login form
                  // Form(
                  //   key: _formKey,
                  //   child: Flex(
                  //     direction: Axis.vertical,
                  //     children: [
                  //       /// Email field
                  //       TextFormField(
                  //         controller: _emailController,
                  //         decoration: const InputDecoration(
                  //           labelText: "E-Mail"
                  //         ),
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return AppLocalizations.of(context)!.enter_email;
                  //           }
                  //           if(!RegExp(r"^[a-zA-Z\d.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z\d](?:[a-zA-Z\d-]{0,253}[a-zA-Z\d])?(?:\.[a-zA-Z\d](?:[a-zA-Z\d-]{0,253}[a-zA-Z\d])?)*$")
                  //               .hasMatch(value)) {
                  //             return AppLocalizations.of(context)!.enter_correct_email;
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       const SizedBox(height: 16),
                  //
                  //       /// Password
                  //       TextFormField(
                  //         controller:  _passwordController,
                  //         obscureText: true,
                  //         decoration: InputDecoration(
                  //           labelText: AppLocalizations.of(context)!.password,
                  //         ),
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return AppLocalizations.of(context)!.enter_password;
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       const SizedBox(height: 16),
                  //
                  //       /// Submit Button
                  //       BlocBuilder<AuthorizationBloc, AuthorizationState>(
                  //         builder: (context, state) {
                  //           if(state is AuthorizationLoadingState) {
                  //             return Row(
                  //               children: [
                  //                 Expanded(
                  //                   child: ElevatedButton(
                  //                     onPressed: () {
                  //                     },
                  //                     child: const SizedBox(
                  //                       height: 16,
                  //                       width: 16,
                  //                       child: CircularProgressIndicator(
                  //                         color: Colors.white,
                  //                         strokeWidth: 2,
                  //                       ),
                  //                     ),
                  //                   )
                  //                 ),
                  //               ],
                  //             );
                  //           }
                  //           return Row(
                  //             children: [
                  //               Expanded(
                  //                 child: ElevatedButton(
                  //                   onPressed: () {
                  //                     bool validate = _formKey.currentState!.validate();
                  //                     if(validate) {
                  //                       FocusManager.instance.primaryFocus?.unfocus();
                  //                       GetIt.I.get<AuthorizationBloc>().add(AuthorizationLoginButtonPressedEvent(
                  //                         username: _emailController.text,
                  //                         password: _passwordController.text
                  //                       ));
                  //                       // GoRouter.of(context).pushReplacementNamed(AppRouteConstants.setPinCodeRoteName);
                  //                     }
                  //                   },
                  //                   child: Text(AppLocalizations.of(context)!.login)
                  //                 )
                  //               ),
                  //             ],
                  //           );
                  //         },
                  //       ),
                  //       const SizedBox(height: 32),
                  //     ],
                  //   ),
                  // ),

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
