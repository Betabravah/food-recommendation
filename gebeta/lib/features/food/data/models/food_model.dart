import 'dart:convert';

import '../../domain/entities/food.dart';

class FoodModel extends Food {
  FoodModel(
      {required super.description,
      required super.category,
      required super.images,
      required super.nutrition});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    final nutrition = <String, double>{};

    for (var entry in json['nutrition'].entries) {
      nutrition[entry.key] = double.parse(entry.value.toString());
    }

    print(nutrition);

    return FoodModel(
      category: json['category'] as String,
      description: json['description'] as String,
      images: json['images'].map<String>((k) => k as String).toList(),
      nutrition: nutrition,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'images': images,
      'nutrition': nutrition,
      'category': category,
    };
  }
}
