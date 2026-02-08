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
  final int expirationMonth;
  final bool isOrganic ;
  final int numberOfCalories;
  final int unitAmout;
  final int avgRating = 0;
  final int ratingCount = 0;
  AddProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmout,
     this.isOrganic= false,
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
      expirationMonth: entity.expirationMonth,
      numberOfCalories: entity.numberOfCalories,
      unitAmout: entity.unitAmout,
      isOrganic: entity.isOrganic,
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
      'expirationMonth': expirationMonth,
      'numberOfCalories': numberOfCalories,
      'unitAmout': unitAmout,
      'isOrganic': isOrganic,
   
    };
  }
}
