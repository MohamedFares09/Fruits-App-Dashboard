import 'dart:io';

import 'package:fruit_app_dashboard/features/add_product/doman/entities/review_entity.dart';

class AddProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? urlImage;
  final int expirationMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmout;
  final int avgRating = 0;
  final int ratingCount = 0;
  final List<ReviewEntity> reviews;
  AddProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.isOrganic = false,
    this.urlImage,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmout,
    required this.reviews,
  });
}
