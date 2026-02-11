import 'package:fruit_app_dashboard/features/add_product/doman/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String date;
  final String image;
  final int rating;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.date,
    required this.image,
    required this.rating,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      date: entity.date,
      image: entity.image,
      rating: entity.rating,
      reviewDescription: entity.reviewDescription,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      date: json['date'],
      image: json['image'],
      rating: json['rating'],
      reviewDescription: json['reviewDescription'],
    );
  }
  toJson() {
    return {
      'name': name,
      'date': date,
      'image': image,
      'rating': rating,
      'reviewDescription': reviewDescription,
    };
  }
}
