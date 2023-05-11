import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/statistic/screens/src/statistic_page.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showCupertinoModalPopup(context: context, builder: (context) {
                  return CupertinoActionSheet(
                    actions: <CupertinoActionSheetAction>[
                      CupertinoActionSheetAction(
                        child: const Text('Удалить из друзей', style: TextStyle(
                            color: Colors.red
                        ),),
                        onPressed: () {
                          Navigator.pop(context);
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text(
                                "Удалить Лидия В.\nиз друзей?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 17
                                ),
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                "После удаления вы не сможете\nотслеживать достижения\nдруг друга",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.5)
                                ),
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                CupertinoActionSheetAction(onPressed: () {
                                  Navigator.pop(context);
                                }, child: const Text("Отмена", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 17),)),
                                CupertinoActionSheetAction(onPressed: () {
                                  Navigator.pop(context);
                                }, child: const Text("Да, удалить", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 17),)),

                              ],
                            )
                          );
                        },
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: const Text('Отмена'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                });
              },
              icon: const Icon(Icons.more_vert_rounded)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 32),

            /// Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 96,
                  width: 96,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Image.network(
                    widget.userModel.avatar!
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.userModel.firstname} ${widget.userModel.lastname.substring(0, 1)}.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24
                  ),
                )
              ],
            ),

            /// Id
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "@${widget.userModel.identifier}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),

            /// Statistic
            Flex(
              direction: Axis.horizontal,
              children: [

                /// Steps
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Logo
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.activity,
                              width: 21.32,
                              height: 26.73,
                              // ignore: deprecated_member_use
                              color: HexColor.fromHex('#FF9500'),
                              theme: SvgTheme(
                                  currentColor: HexColor.fromHex('#FF9500')
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        /// Amount
                        const Text(
                          "0",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                        const SizedBox(height: 4),

                        /// Subtitle
                        const Text(
                          "Шагов пройдено",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                /// Step verified
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const StatisticPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Logo
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.success,
                                width: 26.67,
                                height: 26.67,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          /// Amount
                          const Text(
                            "0",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                          ),
                          const SizedBox(height: 4),

                          /// Subtitle
                          const Text(
                            "Шагов засчитано",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }

}
