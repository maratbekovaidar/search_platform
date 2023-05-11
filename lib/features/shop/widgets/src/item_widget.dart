// ignore_for_file: deprecated_member_use

import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/shop/bloc/bloc.dart';
import 'package:dsplatform/features/shop/domain/models/product/product_model.dart';
import 'package:dsplatform/features/shop/domain/models/purchase_enum/purchase_enum.dart';
import 'package:dsplatform/features/shop/domain/repositories/product_repository.dart';
import 'package:dsplatform/features/shop/screens/src/shop_not_enough_page.dart';
import 'package:dsplatform/features/shop/screens/src/shop_success_page.dart';
import 'package:dsplatform/features/shop/widgets/src/like_button.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.productModel}) : super(key: key);

  final ProductModel productModel;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  
  ProductBloc productBloc = ProductBloc(productRepository: IProductRepository());
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productBloc,
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if(state is ProductPurchaseSuccessState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopSuccessPage()));
          }
          if(state is ProductFailureState) {
            showErrorNotificationWidget(context);
          }
          if(state is ProductPurchaseFailureState) {
            if(state.purchaseEnum == PurchaseEnum.NOT_ENOUGH_COST) {
              showNotificationWidget(context, "Недостаточно TER-токенов", NotificationWidgetType.error);
            }
            if(state.purchaseEnum == PurchaseEnum.NOT_ENOUGH_COUNT) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopNotEnoughPage()));
            } else {
              showErrorNotificationWidget(context);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
          child: InkWell(
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

                        /// Item
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [


                              /// Image, seller and like button
                              Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [

                                  /// Image
                                  Stack(
                                    children: [
                                      /// Image
                                      Center(
                                        child: SizedBox(
                                          height: 200,
                                          child: Image.network(
                                            widget.productModel.image,
                                          ),
                                        ),
                                      ),

                                      /// Seller
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                              decoration: BoxDecoration(
                                                  color: HexColor.fromHex("#FF2D55"),
                                                  borderRadius: BorderRadius.circular(16)
                                              ),
                                              child: Row(
                                                children: [

                                                  /// Merchant name
                                                  Text(
                                                    widget.productModel.productUrl,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),

                                                  /// Link icon
                                                  SvgPicture.asset(
                                                    Assets.icons.externalLink,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),

                                  Align(
                                      alignment: AlignmentDirectional.bottomStart,
                                      child: Row(
                                        children: const [
                                          LikeButton(isLiked: true, likeAmount: 568),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              /// Name
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.productModel.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),

                              /// Price
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${NumberFormat("#,##0.00").format(widget.productModel.cost)} TER",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),

                              /// Amount
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.productModel.isAvailable ? "Осталось ${widget.productModel.count} шт." : "Ожидаем поступления",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),

                              /// Description
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 32,
                                    child: Text(
                                      widget.productModel.description,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),

                              /// Buy button
                              widget.productModel.isAvailable ?
                              BlocBuilder<ProductBloc, ProductState>(
                                bloc: productBloc,
                                builder: (context, state) {
                                  if(state is ProductLoadingState) {
                                    return Row(
                                      children: [
                                        Expanded(child: ElevatedButton(onPressed: () {
                                        }, child:  const SizedBox(
                                          height: 16,
                                          width: 16,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )))
                                      ],
                                    );
                                  }
                                  return Row(
                                    children: [
                                      Expanded(child: ElevatedButton(onPressed: () {
                                        productBloc.add(ProductPurchaseEvent(productObjectId: widget.productModel.objectId));
                                      }, child: Text("Купить за ${NumberFormat("#,##0.00").format(widget.productModel.cost)} TER")))
                                    ],
                                  );
                                },
                              )
                              : Container(),

                              const SizedBox(height: 30)
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Stack(
                children: [
                  /// Content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      /// Image
                      Expanded(
                        child: Image.network(
                          widget.productModel.image
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// Title
                      Text(
                        widget.productModel.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(height: 4),

                      /// Price
                      Text(
                        "${NumberFormat("#,##0.00").format(widget.productModel.cost)} TER",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Theme.of(context).primaryColor
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        widget.productModel.isAvailable ? "Осталось ${widget.productModel.count} шт." : "Ожидаем поступления",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),

                  /// Like button
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: const [
                        LikeButton(isLiked: false, likeAmount: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
