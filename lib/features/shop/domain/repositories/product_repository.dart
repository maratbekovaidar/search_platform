import 'package:dsplatform/features/shop/domain/models/category/category_model.dart';
import 'package:dsplatform/features/shop/domain/models/like/like_model.dart';
import 'package:dsplatform/features/shop/domain/models/product/product_model.dart';
import 'package:dsplatform/features/shop/domain/models/purchase_enum/purchase_enum.dart';
import 'package:dsplatform/features/shop/domain/services/product_service.dart';

abstract class ProductRepository {

  Future<List<ProductModel>> getProducts();

  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getProductsByCategory(String categoryId);

  Future<PurchaseEnum> purchaseProduct(String objectId);

  Future<LikeModel> getLikes(String objectId);

  Future<bool> likeProduct(String objectId);

}

class IProductRepository implements ProductRepository {

  final ProductService _productService = ProductService();

  @override
  Future<List<ProductModel>> getProducts() => _productService.getProducts();

  @override
  Future<List<CategoryModel>> getCategories() => _productService.getCategories();

  @override
  Future<List<ProductModel>> getProductsByCategory(String categoryId) => _productService.getProductsByCategory(categoryId);

  @override
  Future<PurchaseEnum> purchaseProduct(String objectId) => _productService.purchaseProduct(objectId);

  @override
  Future<LikeModel> getLikes(String objectId) => _productService.getLikes(objectId);

  @override
  Future<bool> likeProduct(String objectId) => _productService.likeProduct(objectId);

}