import 'package:flutter/material.dart';

class AuthenticateLoadingPage extends StatelessWidget {
  const AuthenticateLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
