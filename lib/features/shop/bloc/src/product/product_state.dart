part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductCategoriesLoadedState extends ProductState {
  final List<CategoryModel> categories;
  ProductCategoriesLoadedState({required this.categories});
}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  ProductLoadedState({required this.categories, required this.products});
}

class ProductFailureState extends ProductState {}

class ProductPurchaseSuccessState extends ProductState {}

class ProductPurchaseFailureState extends ProductState {
  final PurchaseEnum purchaseEnum;
  ProductPurchaseFailureState({required this.purchaseEnum});
}