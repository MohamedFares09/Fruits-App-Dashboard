import 'dart:io';

class AddProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? urlImage;
  final int expirationMonth;
  final bool isOrganic = false;
  final int numberOfCalories;
  final int unitAmout;
  final int avgRating = 0;
  final int ratingCount = 0;
  AddProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.urlImage,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmout,
  });
}
