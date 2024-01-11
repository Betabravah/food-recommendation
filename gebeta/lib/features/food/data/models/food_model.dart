import '../../domain/entities/food.dart';

class FoodModel extends Food {
  FoodModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.nutrients});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        nutrients: List<String>.from(json['nutrients']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'nutrients': nutrients
    };
  }
}
