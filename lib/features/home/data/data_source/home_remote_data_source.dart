import 'package:ecommerce_app_huma_volve/features/home/data/models/home_category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/home_product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeCategoryModel>> getCategories();
  Future<List<HomeProductModel>> getProducts(int? categoryId);
}
