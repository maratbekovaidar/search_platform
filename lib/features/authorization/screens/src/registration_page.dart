import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/authorization/bloc/bloc.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  bool isUserInvited = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Регистрация"
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
                      Assets.icons.profile,
                      fit: BoxFit.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Form(
                key: _formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    /// Email field
                    TextFormField(
                      controller: _emailController,
                      onChanged: (value) {
                        GetIt.I.get<AuthorizationBloc>().add(AuthorizationIsUserInvitedEvent(email: _emailController.text));
                      },
                      decoration: const InputDecoration(
                        labelText: "Ваш E-Mail",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите E-Mail';
                        }
                        if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(value)) {
                          return 'Введите корректный E-Mail';
                        }
                        // if(isUserInvited == false) {
                        //   return "E-Mail не найден в списке приглашенных";
                        // }
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
                                    GoRouter.of(context).push("/registration_set_password/${_emailController.text}");
                                  }
                                },
                                child: const Text("Продолжить")
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
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
