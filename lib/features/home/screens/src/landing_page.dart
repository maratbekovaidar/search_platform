import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final List<bool> _isOpen = List.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Что такое AlgaApp?"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 40),

          /// Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: HexColor.fromHex("#00A8FF"),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: SvgPicture.asset(Assets.logo.mainLogo),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),

          /// App name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "AlǵaApp",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Colors.black
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          /// App description
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Приложение, которое позволяет\nполучать вознаграждение\nза пройденные шаги",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              )
            ],
          ),
          const SizedBox(height: 48),

          /// App goals
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [

                /// Goal's title
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Для чего вам нужно\nприложение?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black
                      ),

                    ),
                  ],
                ),
                const SizedBox(height: 24),

                /// Motivation
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Activity icon
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor.fromHex("#FF9500", opacity: 0.1)
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.icons.activity),
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Дополнительная мотивация",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        
                        /// Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Пользуясь приложением, вы\n"
                                "увеличиваете повседневную\n"
                                "активность. А чем больше движения,\n"
                                "тем лучше ваша форма",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),

                /// Shop
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Shop icon
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor.fromHex("#00A8FF", opacity: 0.1)
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.icons.shop),
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Магазин c товарами",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        /// Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Вы получаете доступ к магазину\n"
                                  "с реальными товарами, которые можноп\n"
                                  "окупать на заработанные TER-токены",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),

                /// Community
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Community icon
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor.fromHex("#FF0000", opacity: 0.1)
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.icons.community),
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Активное комьюнити",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        /// Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Вы становитесь частью комьюнити\nединомышленников, поддерживающих\nактивный образ жизни",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),

              ],
            ),
          ),
          const SizedBox(height: 48),

          /// TER description
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title
                const Text(
                  "Что такое TER-токен?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
                const SizedBox(height: 12),

                /// Description
                const Text(
                  "Это виртуальная валюта, которую\nпользователь получает за шаги",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 12),

                /// Exchange Rates
                Container(
                  width: 210,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor.fromHex("#1E1E1E"),
                      width: 0.1
                    )
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.logo.coin
                      ),
                      Text(
                        "1 TER ",
                        style: TextStyle(
                          color: HexColor.fromHex("#00A8FF"),
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                        ),
                      ),
                      const Text(
                        " = 10,000 шагов",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 48),

          /// How to use
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [

                /// Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Как пользоваться\nприложением?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                /// Step 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Number 1
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).primaryColor
                      ),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Разрешите приложению получать\nдоступ к вашей геолокации",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        /// Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Это позволит приложению считать\nваши шаги",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),

                /// Step 2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Number 2
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).primaryColor
                      ),
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Двигайтесь и получайте\nвознаграждение",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        /// Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "TER-токены перечисляются на\nвнутренний кошелёк ежедневно ",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),

                /// Step 3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Number 3
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).primaryColor
                      ),
                      child: const Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Покупайте товары за TER-токены",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        /// Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Доступные товары представлены \nв Магазине — они ограничены \nпо времени и количеству",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(height: 64),

          /// Often questions
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                /// Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Популярные вопросы",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: HexColor.fromHex("#1E1E1E")
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                /// Questions
                ExpansionPanelList(
                  elevation: 0,
                  expandedHeaderPadding: EdgeInsets.zero,
                  children: [
                    ExpansionPanel(
                      isExpanded: _isOpen[0],
                      backgroundColor: Colors.transparent,
                      headerBuilder: (context, isOpen) {
                        return const Text(
                          "Какую активность засчитывает приложение?",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black
                          ),
                        );
                      },
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Приложение считает ваши шаги — это\nможет быть неспешная прогулка, быстрая\nходьба или бег",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            ),
                          ),
                        ],
                      )
                    ),
                    ExpansionPanel(
                        isExpanded: _isOpen[1],
                        backgroundColor: Colors.transparent,
                        headerBuilder: (context, isOpen) {
                          return const Text(
                            "Какую активность засчитывает приложение?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black
                            ),
                          );
                        },
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Приложение считает ваши шаги — это\nможет быть неспешная прогулка, быстрая\nходьба или бег",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        )
                    ),
                    ExpansionPanel(
                        isExpanded: _isOpen[2],
                        backgroundColor: Colors.transparent,
                        headerBuilder: (context, isOpen) {
                          return const Text(
                            "Какую активность засчитывает приложение?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black
                            ),
                          );
                        },
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Приложение считает ваши шаги — это\nможет быть неспешная прогулка, быстрая\nходьба или бег",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        )
                    ),
                    ExpansionPanel(
                        isExpanded: _isOpen[3],
                        backgroundColor: Colors.transparent,
                        headerBuilder: (context, isOpen) {
                          return const Text(
                            "Какую активность засчитывает приложение?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black
                            ),
                          );
                        },
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Приложение считает ваши шаги — это\nможет быть неспешная прогулка, быстрая\nходьба или бег",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                  expansionCallback: (index, isOpen) {
                    setState(() {
                      _isOpen[index] = !isOpen;
                    });
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 64),

        ],
      ),
    );
  }
}
