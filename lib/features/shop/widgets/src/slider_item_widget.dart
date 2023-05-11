// ignore_for_file: deprecated_member_use

import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderItemWidget extends StatefulWidget {
  const SliderItemWidget({Key? key}) : super(key: key);



  @override
  State<SliderItemWidget> createState() => _SliderItemWidgetState();
}

class _SliderItemWidgetState extends State<SliderItemWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [

            /// Image
            Wrap(
              children: [
                GestureDetector(
                  onTap: () {

                  },
                  child: Image.asset(
                    Assets.images.advertisment.path,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),


            /// Advertisement widget
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
                            // minHeight: MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
                          ),
                          builder: (context) {
                            return Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  )
                              ),
                              child: Wrap(
                                children: [
                                  /// Holder
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(4),
                                        height: 4,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.12),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                      )
                                    ],
                                  ),

                                  /// Close icon
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(onPressed: () {
                                          Navigator.pop(context);
                                        }, icon: Icon(Icons.close, color: HexColor.fromHex("#7E7E7E"),))
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Реклама",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.black
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          "Мы предлагаем размещение на нашей платформе. У нас есть разные способы продвижения",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Узнать больше о рекламе в AlgaApp",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: HexColor.fromHex("#00A8FF")
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            SvgPicture.asset(
                                              Assets.icons.externalLink,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 30)
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          }
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.15),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.white.withOpacity(0.5),
                            size: 8,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            "Реклама",
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
