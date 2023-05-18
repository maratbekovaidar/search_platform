import 'package:dsplatform/configurations/theme/src/hex_color_extension.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:dsplatform/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData get basic => ThemeData(
    primaryColor: HexColor.getPrimarySwatch("#00A8FF"),
    primarySwatch: HexColor.getPrimarySwatch("#00A8FF"),
    scaffoldBackgroundColor: HexColor.fromHex("#F2F2F2"),

    fontFamily: FontFamily.robotoSlab,

    /// App Bar theming
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
      titleTextStyle: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: FontFamily.robotoSlab,
      ),
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: HexColor.getPrimarySwatch("#00A8FF")
      ),
      iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.8)
      )
    ),

    /// Icon theme
    iconTheme: IconThemeData(
      color: HexColor.getPrimarySwatch("#00A8FF")
    ),

    /// Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16)),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 16
          )
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          )
        ),
      )
    ),

    /// Text field theme
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        color: Colors.black54,
        // fontSize: 10
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.only(top: 8, bottom: 16, right: 16, left: 16),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          width: 1,
          style: BorderStyle.none,
          color: Colors.red
        ),
      ),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelStyle: const TextStyle(
        fontSize: 10
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none
        ),
      ),
    ),

    /// Bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: HexColor.getPrimarySwatch("#00A8FF")
      ),
      backgroundColor: Colors.white,
      unselectedIconTheme: const IconThemeData(
        color: Colors.black38
      ),
      unselectedItemColor: Colors.black38,
      selectedItemColor: Colors.black,
      unselectedLabelStyle: const TextStyle(
        color: Colors.black38,
        fontSize: 10,
        height: 2
      ),
      selectedLabelStyle: TextStyle(
        color: HexColor.getPrimarySwatch("#00A8FF"),
        fontSize: 10,
        height: 2
      )
    ),

    /// Snack bar theme
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),

    /// Tab bar theme
    // tabBarTheme: TabBarTheme(
    //   indicator: BoxDecoration(
    //     color: Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.04),
    //         offset: const Offset(3, 1),
    //         blurRadius: 1
    //       ),
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.04),
    //         offset: const Offset(-3, 1),
    //         blurRadius: 1
    //       ),
    //     ],
    //     borderRadius: BorderRadius.circular(6)
    //   ),
    //   labelStyle: const TextStyle(
    //     color: Colors.black,
    //     fontSize: 12,
    //     fontWeight: FontWeight.w500
    //   ),
    //   unselectedLabelStyle: const TextStyle(
    //       color: Colors.black,
    //       fontSize: 12,
    //       fontWeight: FontWeight.w500
    //   ),
    //   indicatorSize: TabBarIndicatorSize.tab,
    //   labelPadding: const EdgeInsets.all(0),
    //   unselectedLabelColor: Colors.black,
    //   overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.05)),
    // )


  );

}