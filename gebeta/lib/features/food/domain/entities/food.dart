import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String description;
  final String category;
  final List<String> images;
  final Map<String, double> nutrition;

  const Food({
    required this.description,
    required this.category,
    required this.images,
    required this.nutrition,
  });

  @override
  List<Object?> get props => [
        category,
        description,
        images,
      ];
}
