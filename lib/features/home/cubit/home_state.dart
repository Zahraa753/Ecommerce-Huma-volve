import 'package:ecommerce_app_huma_volve/features/home/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesLoading extends HomeState {}

class CategoriesSuccess extends HomeState {
  late List<CategoryModel> categoryList;
  CategoriesSuccess(this.categoryList);
}

class CategoriesFail extends HomeState {
  late String error;
  CategoriesFail(this.error);
}


class ProductsLoading extends HomeState {}

class ProductsSuccess extends HomeState {
  late List<ProductModel> productList;
  ProductsSuccess(this.productList);
}

class ProductsFail extends HomeState {
  late String error;
  ProductsFail(this.error);
}
