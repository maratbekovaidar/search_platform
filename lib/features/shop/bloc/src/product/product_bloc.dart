import 'package:dsplatform/features/shop/domain/models/category/category_model.dart';
import 'package:dsplatform/features/shop/domain/models/purchase_enum/purchase_enum.dart';
import 'package:dsplatform/features/shop/domain/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/product/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitialState()) {

    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        List<ProductModel> products;
        if(event.categoryId == null) {
          products = await productRepository.getProducts();
        } else {
          products = await productRepository.getProductsByCategory(event.categoryId!);
        }
        return emit(ProductLoadedState(products: products, categories: await productRepository.getCategories()));
      } on Exception catch (e, _) {
        return emit(ProductFailureState());
      }
    });

    on<ProductCategoryLoadEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        emit(ProductCategoriesLoadedState(
          categories: await productRepository.getCategories()
        ));
      } on Exception catch(e, _) {
        emit(ProductFailureState());
      }
    });

    on<ProductPurchaseEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        PurchaseEnum purchaseEnum = await productRepository.purchaseProduct(event.productObjectId);
        if(purchaseEnum == PurchaseEnum.SUCCESS) {
          return emit(ProductPurchaseSuccessState());
        } else {
          return emit(ProductPurchaseFailureState(purchaseEnum: purchaseEnum));
        }
      } on Exception catch(e, _) {
        return emit(ProductFailureState());
      }
    });

  }
}
