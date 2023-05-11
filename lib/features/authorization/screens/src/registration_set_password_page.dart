import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/authorization/bloc/src/authorization_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class RegistrationSetPasswordPage extends StatefulWidget {
  const RegistrationSetPasswordPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<RegistrationSetPasswordPage> createState() => _RegistrationSetPasswordPageState();
}

class _RegistrationSetPasswordPageState extends State<RegistrationSetPasswordPage> {

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmController;

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool checkBox = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }


  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if(state is AuthorizationFailureState) {
          showNotificationWidget(
            context,
            "Не получилось, повторите позже...",
            NotificationWidgetType.error,
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            "Регистрация"
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 32),

            /// Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/unselected_profile.svg",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 69),

            Form(
              key: _formKey,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  /// Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                        labelText: "Придумайте пароль",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          child: Icon(
                            obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black38,
                          ),
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите пароль';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  /// Confirm password
                  TextFormField(
                    obscureText: obscureConfirmPassword,
                    controller: _passwordConfirmController,
                    decoration: InputDecoration(
                        labelText: "Повторите пароль",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                          child: Icon(
                            obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black38,
                          ),
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите пароль';
                      }
                      if(value != _passwordController.text) {
                        return 'Пароли не совпадают';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  /// Submit Button
                  BlocBuilder<AuthorizationBloc, AuthorizationState>(
                    builder: (context, state) {
                      if(state is AuthorizationLoadingState) {
                        return Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                    },
                                    child: const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                )
                            ),
                          ],
                        );
                      }
                      return Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: checkBox ? () {
                                    bool validation = _formKey.currentState!.validate();
                                    if(validation) {
                                      GetIt.I.get<AuthorizationBloc>().add(AuthorizationRegistrationButtonPressedEvent(username: widget.email, password: _passwordController.text));
                                      // GoRouter.of(context).pushNamed(AppRouteConstants.setPinCodeRoteName);
                                    }
                                  } : () {},
                                style: checkBox ? null : ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey)
                                ),
                                  child: const Text("Зарегистрироваться"),
                              )
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),

                  /// Privacy Policy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(value: checkBox, onChanged: (value) {
                        setState(() {
                          checkBox = !checkBox;
                        });
                      }),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45
                          ),
                          children: [
                            const TextSpan(
                              text: "Нажимая кнопку «Зарегистрироваться», вы соглашаетесь\nс "
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () => GoRouter.of(context).pushNamed(AppRouteConstants.termsOfUseRouteName),
                              text: "пользовательским соглашением ",
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45
                              )
                            ),
                            const TextSpan(
                              text: "и"
                            ),
                            TextSpan(
                              text: " политикой\nконфиденциальности",
                              recognizer: TapGestureRecognizer()..onTap = () => GoRouter.of(context).pushNamed(AppRouteConstants.privacyPolicyRouteName),
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45
                              )
                            )
                          ]
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
