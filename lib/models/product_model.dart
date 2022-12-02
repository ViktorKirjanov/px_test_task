import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.year,
    required this.code,
    required this.bottle,
    required this.image,
  });

  final String name;
  final int year;
  final int code;
  final String bottle;
  final String image;

  @override
  List<Object?> get props => [
        name,
        year,
        code,
        bottle,
        image,
      ];
}
