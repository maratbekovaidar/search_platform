import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/widgets/src/numpad_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vibration/vibration.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({Key? key, required this.pinCodeCallback, this.localAuth, required this.localAuthCallback, required this.userFullName}) : super(key: key);

  final PinCodeCallback pinCodeCallback;
  final LocalAuthCallback localAuthCallback;
  final String? localAuth;
  final String userFullName;

  @override
  State<PinCodePage> createState() => PinCodePageState();
}

class PinCodePageState extends State<PinCodePage> {

  final numPadKey = GlobalKey<NumPadWidgetState>();

  void clearPinCode() {
    numPadKey.currentState!.clearPinCode();
  }

  Future vibrate() async {
    if (await Vibration.hasVibrator() != null) {
      Vibration.vibrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Привет, ${widget.userFullName}"
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              GetIt.I.get<AuthenticationBloc>().add(LoggedOut());
            },
            icon: const Icon(Icons.exit_to_app_rounded, color: Colors.blue)
          )
        ],
        leading: CloseButton(
          onPressed: () {
            GetIt.I.get<AuthenticationBloc>().add(LoggedOut());
          },
          color: Colors.black45,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Введите пин код",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 26),
          NumPadWidget(
            key: numPadKey,
            localAuth: widget.localAuth,
            pinCodeCallback: widget.pinCodeCallback, localAuthCallback: widget.localAuthCallback,
          )
        ],
      ),
    );
  }

}
