part of 'product_bloc.dart';

abstract class ProductEvent {}

class ProductLoadEvent extends ProductEvent {
  final String? categoryId;
  ProductLoadEvent({this.categoryId});
}

class ProductCategoryLoadEvent extends ProductEvent {
  final String objectId;
  ProductCategoryLoadEvent({required this.objectId});
}

class ProductPurchaseEvent extends ProductEvent {
  final String productObjectId;
  ProductPurchaseEvent({required this.productObjectId});
}

