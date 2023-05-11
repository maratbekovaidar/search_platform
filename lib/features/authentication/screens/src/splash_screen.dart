 import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         color: HexColor.fromHex("#42a5f5"),
         child: Center(
           child: Assets.logo.logo.image(
             height: 100,
             width: 100
           ),
         ),
       ),
     );
   }
 }
