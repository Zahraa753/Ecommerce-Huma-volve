import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/constants/api_constants.dart';
import 'package:ecommerce_app_huma_volve/core/network/dio_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/home_category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/home_product_model.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  Dio dioClient;
  HomeRemoteDataSourceImp(this.dioClient) ;

  @override
  Future<List<HomeCategoryModel>> getCategories() async {
    final response = await dioClient.get(ApiConstants.categoriesPath);

    final List<dynamic> jsonData = response.data as List<dynamic>;
    final List<HomeCategoryModel> category = jsonData
        .map((e) => HomeCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return category;
  }

  @override
  Future<List<HomeProductModel>> getProducts(int? categoryId) async {
    final Response<dynamic> response;

    if (categoryId != null) {
      response = await dioClient.get(
        '${ApiConstants.categoriesPath}/$categoryId${ApiConstants.productsPath}',
      );
    } else {
      response = await dioClient.get(ApiConstants.productsPath);
    }

    final List<dynamic> jsonData = response.data as List<dynamic>;
    final List<HomeProductModel> products = jsonData
        .map((e) => HomeProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return products;
  }
}
