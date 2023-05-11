import 'package:dsplatform/configurations/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Восстановление пароля",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                      "assets/icons/password_recovery.svg",
                      fit: BoxFit.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              /// Recovery form
              Form(
                key: _formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    /// Email field
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "E-Mail"
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите E-Mail';
                        }
                        if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(value)) {
                          return 'Введите корректный E-Mail';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    /// Submit Button
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  bool validation = _formKey.currentState!.validate();
                                  if(validation) {
                                    GoRouter.of(context).pushNamed(AppRouteConstants.passwordRecoveryConfirmRoteName);
                                  }
                                },
                                child: const Text("Восстановить пароль")
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              /// Cancel
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Text(
                    "Отменить",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  )
              ),

              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              )

            ],
          ),
        ),
      ),
    );
  }
}
