import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
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
          "Bookmark"
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
