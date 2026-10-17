import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/repository/home_repsitory_imp.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

class GetProductUseCase {
  final HomeRepository homeRepository;
  GetProductUseCase( {required this.homeRepository});
  Future<Either<Failure, List<HomeProductEntity>>> invoke(int? categoryId) =>
      homeRepository.getProducts(categoryId);
}
