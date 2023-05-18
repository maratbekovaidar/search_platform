import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
        ),
        title: const Text(
          "Search",
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
