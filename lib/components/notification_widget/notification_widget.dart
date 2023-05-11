import 'package:dsplatform/configurations/theme/src/hex_color_extension.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum NotificationWidgetType {
  error,
  success,
}

void showNotificationWidget(BuildContext context, String message, NotificationWidgetType type) {
  Flushbar(
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400
      ),
    ),
    flushbarPosition: FlushbarPosition.TOP,
    icon: type == NotificationWidgetType.error ? const Icon(
      Icons.error_outline_rounded,
      color: Colors.red,
    ) : SvgPicture.asset(
      Assets.icons.success,
      width: 20,
      height: 20,
    ),
    borderColor: HexColor.fromHex("#3C3C43", opacity: 0.36),
    borderWidth: 0.5,
    backgroundColor: Colors.white,
    margin: const EdgeInsets.all(16),
    flushbarStyle: FlushbarStyle.FLOATING,
    duration: const Duration(seconds: 3),
    borderRadius: BorderRadius.circular(12),
  ).show(context);

}

void showErrorNotificationWidget(BuildContext context) => showNotificationWidget(context, "Не получилось, повторите позже...", NotificationWidgetType.error);