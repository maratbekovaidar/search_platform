import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light
        ),
        title: const Text("Работы"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
