// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:dsplatform/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import '../../../../gen/assets.gen.dart';

typedef PinCodeCallback = void Function(String pinCode);
typedef LocalAuthCallback = void Function(bool result);

class NumPadWidget extends StatefulWidget {
  const NumPadWidget({Key? key, required this.pinCodeCallback, this.localAuth, required this.localAuthCallback}) : super(key: key);

  final PinCodeCallback pinCodeCallback;
  final LocalAuthCallback localAuthCallback;
  final String? localAuth;

  @override
  State<NumPadWidget> createState() => NumPadWidgetState();
}

class NumPadWidgetState extends State<NumPadWidget> {

  List<int> pinCode = [];

  void clearPinCode() {
    pinCode.clear();
    setState(() {

    });
  }

  void addNumber(int num) {
    if(pinCode.length < 4) {
      pinCode.add(num);
      if(pinCode.length == 4) {
        widget.pinCodeCallback(pinCode.join());
      }
      setState(() {
      });
    }
  }

  Future executeLocalAuth() async {
    try {
      final bool didAuthenticate = await LocalAuthentication().authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(biometricOnly: true),
          authMessages: <AuthMessages>[
            const AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
            const IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ]
      );
      widget.localAuthCallback(didAuthenticate);
    } on PlatformException catch(e, _) {
      rethrow;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.localAuth != null ? executeLocalAuth() : () {};

  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 4,
              backgroundColor: pinCode.isNotEmpty ? Theme.of(context).primaryColor : Colors.black38,
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 4,
              backgroundColor: pinCode.length >= 2 ? Theme.of(context).primaryColor : Colors.black38,
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 4,
              backgroundColor: pinCode.length >= 3 ? Theme.of(context).primaryColor : Colors.black38,
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 4,
              backgroundColor: pinCode.length >= 4 ? Theme.of(context).primaryColor : Colors.black38,
            ),
          ],
        ),
        const SizedBox(height: 64),

        /// Numbers
        Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(1);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(2);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(3);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(4);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "4",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(5);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(6);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "6",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(7);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "7",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(8);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "8",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(9);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "9",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                widget.localAuth == null ? const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.transparent,
                ) :
                widget.localAuth == AppSecureStorageKeys.faceIdValue ? Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () async {
                      try {
                        final bool didAuthenticate = await LocalAuthentication().authenticate(
                          localizedReason: 'Please authenticate to show account balance',
                          options: const AuthenticationOptions(biometricOnly: true),
                          authMessages: <AuthMessages>[
                            const AndroidAuthMessages(
                              signInTitle: 'Oops! Biometric authentication required!',
                              cancelButton: 'No thanks',
                            ),
                            const IOSAuthMessages(
                              cancelButton: 'No thanks',
                            ),
                          ]
                        );
                        widget.localAuthCallback(didAuthenticate);
                      } on PlatformException catch(e, _) {
                        rethrow;
                      }
                    },
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.icons.faceId,
                          width: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ) :
                widget.localAuth == AppSecureStorageKeys.touchIdValue ? Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () async {
                      try {
                        final bool didAuthenticate = await LocalAuthentication().authenticate(
                            localizedReason: 'Please authenticate to show account balance',
                            options: const AuthenticationOptions(biometricOnly: true),
                            authMessages: <AuthMessages>[
                              const AndroidAuthMessages(
                                signInTitle: 'Oops! Biometric authentication required!',
                                cancelButton: 'No thanks',
                              ),
                              const IOSAuthMessages(
                                cancelButton: 'No thanks',
                              ),
                            ]
                        );
                        widget.localAuthCallback(didAuthenticate);
                      } on PlatformException catch(e, _) {
                        rethrow;
                      }
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.fingerprint
                        )
                      ),
                    ),
                  ),
                ) :
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(width: 32),

                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      addNumber(0);
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                /// Backspace
                Material(
                  shape : const CircleBorder(),
                  clipBehavior : Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      if(pinCode.isNotEmpty) {
                        pinCode.removeLast();
                        setState(() {

                        });
                      }
                    },
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.backspace_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

          ],
        )
      ],
    );
  }
}
