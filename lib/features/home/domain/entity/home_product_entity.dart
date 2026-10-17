import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entity.dart';

class HomeProductEntity {
  int id;
  String title;
  String slug;
  int price;
  String description;
  HomeCategoryEntity category;
  List<String> images;

  HomeProductEntity({
    this.id = 0,
    this.title = "",
    this.slug = "",
    this.price = 5,
    this.description = "",
    HomeCategoryEntity? category,
    this.images = const [],
  }) : category = category ?? HomeCategoryEntity();
}
