import 'package:equatable/equatable.dart';

class ProductResponseEntity extends Equatable {
  final List<DataEntity> data;

  const ProductResponseEntity({required this.data});

  @override
  List<Object?> get props => [data];
}

class DataEntity extends Equatable {
  final String id;
  final String pname;
  final String size;
  final String prize;
  final String image;

  const DataEntity({
    required this.id,
    required this.pname,
    required this.size,
    required this.prize,
    required this.image,
  });

  @override
  List<Object?> get props => [id, pname, size, prize, image];
}
