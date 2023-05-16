import 'package:dsplatform/configurations/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationSuccessPage extends StatefulWidget {
  const RegistrationSuccessPage({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessPage> createState() => _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Регистрация",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// Success icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/success.svg")
                  ],
                ),
                const SizedBox(height: 24),

                /// Title
                const Text(
                  "Ссылка подтверждение регистрации была отправлена\nна ваш E-Mail",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  "Письмо может попасть в папку «Спам».\nЕсли и там пусто, то запросите\nповторную отправку",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),


            Column(
              children: [

                /// Login with news password
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).pushReplacementNamed(AppRouteConstants.loginRoteName);
                          },
                          child: const Text("Войти под новым паролем")
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// Send again
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text(
                      "Отправить инструкцию повторно",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    )
                ),

                const SizedBox(height: 32)
              ],
            ),


          ],
        ),
      ),
    );
  }
}
