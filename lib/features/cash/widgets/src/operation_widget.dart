import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/cash/domain/models/operation/operation_model.dart';
import 'package:dsplatform/features/cash/domain/models/operation_type/operation_type.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';



class OperationWidget extends StatefulWidget {
  const OperationWidget({Key? key, required this.operationModel}) : super(key: key);

  final OperationModel operationModel;

  @override
  State<OperationWidget> createState() => _OperationWidgetState();
}

class _OperationWidgetState extends State<OperationWidget> {

  Widget getIconByOperationType() {
    switch(widget.operationModel.type) {
      case OperationType.REWARD:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor.fromHex("#FF9500", opacity: 0.1)
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.activity,
              height: 20,
              width: 16,
            ),
          ),
        );
      case OperationType.PROMO_CODE:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor.fromHex("#FF0000", opacity: 0.1)
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.gift,
              height: 20,
              width: 16,
            ),
          ),
        );
      case OperationType.PURCHASE:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor.fromHex("#00A8FF", opacity: 0.1)
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.shop,
              height: 20,
              width: 16,
            ),
          ),
        );
      case OperationType.PURCHASE_CANCELLATION:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor.fromHex("#00A8FF", opacity: 0.1)
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.shop,
              height: 20,
              width: 16,
            ),
          ),
        );
      default:
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor.fromHex("#FF9500", opacity: 0.1)
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.activity,
              height: 20,
              width: 16,
            ),
          ),
        );
    }
  }

  Widget getInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Type operation
        Text(
          "Тип операции:",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Вознаграждение за шаги",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black
          ),
        ),
        const SizedBox(height: 8),

        /// Passed
        Text(
          "Пройдено:",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "15,103",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 8),

        /// Credited
        Text(
          "Засчитано:",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "14,267",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 8),

        /// Accrued
        Text(
          "Начислено::",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "${widget.operationModel.coins.toString()} TER",
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 8),

        /// Date
        Text(
          "Дата и время:",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.5)
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "${DateFormat("MMMMd", "ru_RU").format(DateTime.fromMillisecondsSinceEpoch(widget.operationModel.created))}, "
              "${DateFormat("Hm").format(DateTime.fromMillisecondsSinceEpoch(widget.operationModel.created))}",
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 16),

        /// Status
        Container(
          width: MediaQuery.of(context).size.width - 32,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: HexColor.fromHex("#3C3C435C").withOpacity(0.36),
              width: 0.5
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.success,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                "Операция выполнена",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),

      ],
    );
  }

  String getTitle() {
    if(widget.operationModel.steps != null) {
      return "${NumberFormat.compact().format(widget.operationModel.steps)} шагов";
    }
    if(widget.operationModel.type == OperationType.PROMO_CODE) {
      return "Активация промокода";
    }
    if(widget.operationModel.type == OperationType.REFERRAL) {
      return "Бонус от реферального приглашение";
    }
    if(widget.operationModel.type == OperationType.PURCHASE) {
      return "Покупка товара";
    }
    if(widget.operationModel.type == OperationType.PURCHASE_CANCELLATION) {
      return "Отмена покупки";
    }
    return "Активация промокода";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 100
            ),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            builder: (context) {
              return Wrap(
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

                  /// Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getInfo(),
                      ],
                    ),
                  ),


                ],
              );
            }
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// Main info
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Logo
                getIconByOperationType(),
                const SizedBox(width: 16),

                /// Info
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Main
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Text(
                        getTitle(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),

                    /// Date
                    Text(
                      DateFormat("MMM d, HH:m", "ru_RU").format(DateTime.fromMillisecondsSinceEpoch(widget.operationModel.created)),
                      style: TextStyle(
                          color: HexColor.fromHex("#000000", opacity: 0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 10
                      ),
                    )
                  ],
                ),
              ],
            ),

            /// Amount
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.operationModel.coins < 0 ? widget.operationModel.coins.toString() : "+${widget.operationModel.coins}",
                    style: TextStyle(
                        color: widget.operationModel.coins > 0 ? HexColor.fromHex("#81C827") : HexColor.fromHex("#F14635"),
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
