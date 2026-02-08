import 'dart:io';

import 'package:fruit_app_dashboard/features/add_product/doman/entities/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? urlImage;
  AddProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.urlImage,
  });
  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      isFeatured: entity.isFeatured,
      urlImage: entity.urlImage,
    );
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'urlImage': urlImage,
    };
  }
}
