import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/dummy_data.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data_source_imp.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

class HomeRepsitoryImp implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepsitoryImp(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> getCategories() async {
    try {
      final category = await homeRemoteDataSource.getCategories();
      return Right(category);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<HomeProductEntity>>> getProducts(
    int? categoryId,
  ) async {
    {
      try {
        final product = await homeRemoteDataSource.getProducts(categoryId);
        return Right(product);
      } catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    }
  }
}
