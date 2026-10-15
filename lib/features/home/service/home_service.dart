import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/constants/api_constants.dart';
import 'package:ecommerce_app_huma_volve/core/network/dio_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/product_model.dart';



  
class HomeService {
  HomeService({Dio? dio}) : _dio = dio ?? DioClient.instance;

  final Dio _dio;

  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get(ApiConstants.categoriesPath);

    final List<dynamic> jsonData = response.data as List<dynamic>;

    return jsonData
        .map((e) => CategoryModel.fromJson(
              e as Map<String, dynamic>,
            ))
        .toList();
  }

  Future<List<ProductModel>> getProducts(int? categoryId) async {
    final Response<dynamic> response;

    if (categoryId != null) {
      response = await _dio.get(
        '${ApiConstants.categoriesPath}/$categoryId${ApiConstants.productsPath}',
      );
    } else {
      response = await _dio.get(ApiConstants.productsPath);
    }

    final List<dynamic> jsonData = response.data as List<dynamic>;

    return jsonData
        .map((e) => ProductModel.fromJson(
              e as Map<String, dynamic>,
            ))
        .toList();
  
  }

}
