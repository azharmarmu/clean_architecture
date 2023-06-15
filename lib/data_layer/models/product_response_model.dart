import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';

class ProductResponseModel extends ProductResponseEntity {
  final bool status;
  final String message;
  final List<DataModel> data;

  ProductResponseModel({
    required this.status,
    required this.message,
    required this.data,
  }) : super(data: data);

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      status: json['status'],
      message: json['message'],
      data: List.from(json['data']).map((e) => DataModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }

  @override
  String toString() => toJson().toString();
}

class DataModel extends DataEntity {
  late final String id;
  late final String pname;
  late final String size;
  late final String prize;
  late final String image;

  DataModel({
    required this.id,
    required this.pname,
    required this.size,
    required this.prize,
    required this.image,
  }) : super(
          id: id,
          pname: pname,
          size: size,
          prize: prize,
          image: image,
        );

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      pname: json['pname'],
      size: json['size'],
      prize: json['prize'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pname'] = pname;
    _data['size'] = size;
    _data['prize'] = prize;
    _data['image'] = image;
    return _data;
  }

  @override
  String toString() => toJson().toString();
}
