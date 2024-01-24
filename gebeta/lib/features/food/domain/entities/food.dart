import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final List<String> nutrients;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.nutrients,
  });

  @override
  List<Object?> get props => [id, name, description, photoUrl, nutrients];
}
