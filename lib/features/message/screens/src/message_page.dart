import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/message/screens/src/chat_page.dart';
import 'package:dsplatform/features/message/screens/src/profile_chat_page.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.message
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [

            /// Message
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      /// Icon
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor.fromHex("#00A8FF", opacity: 0.1)
                        ),
                        child: Center(
                          child: SvgPicture.asset(Assets.icons.shop)
                        ),
                      ),
                      const SizedBox(width: 16),

                      /// Title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Магазин",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Информация о покупках",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5)
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      /// Badge
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: HexColor.fromHex("#F14635"),
                        child: const Center(
                          child: Text(
                            "20",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      /// Icon
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              child: Divider(),
            ),

            /// Профиль
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileChatPage()));

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      /// Icon
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: HexColor.fromHex("#FF9500", opacity: 0.1)
                        ),
                        child: Center(
                            child: SvgPicture.asset(Assets.icons.profile, fit: BoxFit.scaleDown, height: 20, width: 20,)
                        ),
                      ),
                      const SizedBox(width: 16),

                      /// Title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Профиль",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Друзья и личные данные",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5)
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      /// Badge
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: HexColor.fromHex("#F14635"),
                        child: const Center(
                          child: Text(
                            "10",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      /// Icon
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              child: Divider(),
            ),

            /// App
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    /// Icon
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor.fromHex("#FF0000", opacity: 0.1)
                      ),
                      child: Center(
                          child: SvgPicture.asset(Assets.icons.vote)
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Приложение",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Новости и уведомления",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5)
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                Row(
                  children: [
                    /// Icon
                    Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              child: Divider(),
            ),
            
          ],
        ),
      ),
    );
  }
}
