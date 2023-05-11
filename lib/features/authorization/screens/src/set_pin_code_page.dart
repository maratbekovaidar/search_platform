import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/widgets/src/numpad_widget.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

class SetPinCodePage extends StatefulWidget {
  const SetPinCodePage({Key? key}) : super(key: key);

  @override
  State<SetPinCodePage> createState() => _SetPinCodePageState();
}

class _SetPinCodePageState extends State<SetPinCodePage> {

  String? pinCode;
  bool error = false;
  final pinCodeKey = GlobalKey<NumPadWidgetState>();
  final pinCode2Key = GlobalKey<NumPadWidgetState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Установка код-пароля"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          error ? const Text(
            "Код-пароль введён неверно",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.red
            ),
          ) : Text(
            pinCode == null ? "Придумайте код-пароль" : "Повторите пароль",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 26),
          pinCode == null ? NumPadWidget(
            pinCodeCallback: (pinCode) {
              this.pinCode = pinCode;
              setState(() {
              });
            }, localAuthCallback: (bool result) {  },
          ) : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              NumPadWidget(
                key: pinCodeKey,
                pinCodeCallback: (pinCode) async {
                  if(this.pinCode == pinCode) {
                    final LocalAuthentication auth = LocalAuthentication();
                    final List<BiometricType> availableBiometrics =
                    await auth.getAvailableBiometrics();

                    if (availableBiometrics.isNotEmpty) {
                      // Some biometrics are enrolled.
                    }

                    if (availableBiometrics.contains(BiometricType.strong) ||
                        availableBiometrics.contains(BiometricType.face)) {
                      await showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            content: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Assets.icons.faceId)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Использовать Face ID\nдля входа в приложение?",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Нет",
                                  style: TextStyle(
                                    color: Colors.blue
                                  ),
                                )
                              ),
                              CupertinoActionSheetAction(
                                  onPressed: () async {
                                    await const FlutterSecureStorage().write(key: AppSecureStorageKeys.localAuthKey,
                                        value: AppSecureStorageKeys.faceIdValue).whenComplete(() => Navigator.pop(context));
                                  },
                                  child: const Text(
                                    "Да",
                                    style: TextStyle(
                                        color: Colors.blue
                                    ),
                                  )
                              ),
                            ],
                          );
                        }
                      ).whenComplete(() async {
                        await const FlutterSecureStorage().write(key: AppSecureStorageKeys.pinCodeKey, value: this.pinCode)
                            .whenComplete(() => GetIt.I.get<AuthenticationBloc>().add(AppStarted()));
                      });
                    } else if(availableBiometrics.contains(BiometricType.strong) ||
                        availableBiometrics.contains(BiometricType.fingerprint)) {
                      await showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              content: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.fingerprint,
                                        color: Colors.black45,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Использовать Touch ID\nдля входа в приложение?",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              actions: [
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Нет",
                                      style: TextStyle(
                                          color: Colors.blue
                                      ),
                                    )
                                ),
                                CupertinoActionSheetAction(
                                    onPressed: () async {
                                      await const FlutterSecureStorage().write(key: AppSecureStorageKeys.localAuthKey,
                                          value: AppSecureStorageKeys.touchIdValue).whenComplete(() => Navigator.pop(context));
                                    },
                                    child: const Text(
                                      "Да",
                                      style: TextStyle(
                                          color: Colors.blue
                                      ),
                                    )
                                ),
                              ],
                            );
                          }
                      ).whenComplete(() async {
                        await const FlutterSecureStorage().write(key: AppSecureStorageKeys.pinCodeKey, value: this.pinCode)
                            .whenComplete(() => GetIt.I.get<AuthenticationBloc>().add(AppStarted()));
                      });
                    } else {
                      await const FlutterSecureStorage().write(key: AppSecureStorageKeys.pinCodeKey, value: this.pinCode)
                          .whenComplete(() => GetIt.I.get<AuthenticationBloc>().add(AppStarted()));
                    }

                  } else {
                    pinCodeKey.currentState!.clearPinCode();
                    this.pinCode = null;
                    error = true;
                    setState(() {

                    });
                    Future.delayed(const Duration(seconds: 2)).whenComplete(() => setState(() {error = false;}));
                  }
                }, localAuthCallback: (bool result) {  },
              )
            ],
          ),


        ],
      ),
    );
  }
}
