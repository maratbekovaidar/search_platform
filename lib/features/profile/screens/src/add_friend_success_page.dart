import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddFriendSuccessPage extends StatelessWidget {
  final String fullName;
  const AddFriendSuccessPage({Key? key, required this.fullName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Пригласить друга"),
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
                SvgPicture.asset(Assets.icons.success),
                const SizedBox(height: 24),
                const Text(
                  "Запрос отправлен",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.black
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "$fullName получит его в течение\nпары минут",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                      child: const Text("Вернуться в Профиль"),
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
