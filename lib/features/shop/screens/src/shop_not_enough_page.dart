// ignore_for_file: deprecated_member_use

import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopNotEnoughPage extends StatefulWidget {
  const ShopNotEnoughPage({Key? key}) : super(key: key);

  @override
  State<ShopNotEnoughPage> createState() => _ShopNotEnoughPageState();
}

class _ShopNotEnoughPageState extends State<ShopNotEnoughPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Оформление заказа"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.error, color: HexColor.fromHex("#F14635"),),
                const SizedBox(height: 24),
                const Text(
                  "Товар уже разобрали :(",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.black
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Вы можете вернуться в магазин\nи выбрать что-то другое",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),
                )
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Вернуться в Магазин"),
                    ))
                  ],
                ),
                const SizedBox(height: 32)
              ],
            )
          ],
        ),
      ),
    );
  }
}
