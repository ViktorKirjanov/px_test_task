import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String code;
  final String image;

  const Product({
    required this.name,
    required this.code,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        code,
        image,
      ];
}
