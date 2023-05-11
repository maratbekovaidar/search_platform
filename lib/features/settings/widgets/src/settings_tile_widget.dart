import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// Info
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Icon
                icon,
                const SizedBox(width: 10),

                /// Title
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black
                  ),
                )
              ],
            ),

            /// Button
            Icon(
              Icons.chevron_right,
              size: 24,
              color: Colors.black.withOpacity(0.5),
            )

          ],
        ),
      ),
    );
  }
}
