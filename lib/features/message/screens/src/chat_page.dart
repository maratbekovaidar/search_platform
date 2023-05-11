import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Магазин"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /// Data
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Text(
                    "сегодня",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 10
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            /// Message
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Assets.images.macbook.image(),
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Заказ оформлен",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "В течение дня менеджер позвонит по номеру +7 (747) 987-32-56, чтобы обсудить детали заказа.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                "Стоимость ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                ),
                              ),
                              Text(
                                "6,590.90 TER",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.blue
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "09:41",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 16),
            /// Data
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Text(
                    "сегодня",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            /// Message
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Assets.images.macbook.image(),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Заказ оформлен",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Поздравляем с покупкой!",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "09:41",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 32)
          ],
        ),
      )
    );
  }
}
