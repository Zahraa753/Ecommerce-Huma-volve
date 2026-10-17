import 'package:ecommerce_app_huma_volve/features/home/data/models/home_category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/home_product_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesLoading extends HomeState {}

class CategoriesSuccess extends HomeState {
  late List<HomeCategoryEntity> categoryList;
  CategoriesSuccess(this.categoryList);
}

class CategoriesFail extends HomeState {
  late String error;
  CategoriesFail(this.error);
}

class ProductsLoading extends HomeState {}

class ProductsSuccess extends HomeState {
  late List<HomeProductEntity> productList;
  ProductsSuccess(this.productList);
}

class ProductsFail extends HomeState {
  late String error;
  ProductsFail(this.error);
}
