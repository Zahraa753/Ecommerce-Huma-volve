import 'package:ecommerce_app_huma_volve/features/home/data/models/home_category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

class HomeProductModel extends HomeProductEntity {

  HomeProductModel({
    super.id,
    super.title,
    super.slug,
    super.price,
    super.description,
    super.category,
    super.images,

  });

  HomeProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = (json['category'] != null
        ? HomeCategoryModel.fromJson(json['category'])
        : null) as HomeCategoryEntity;
    images = json['images'].cast<String>();

  }
}
