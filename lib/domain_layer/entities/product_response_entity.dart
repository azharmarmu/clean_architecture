class ProductResponseEntity {
  final List<DataEntity> data;

  ProductResponseEntity({required this.data});
}

class DataEntity {
  final String id;
  final String pname;
  final String size;
  final String prize;
  final String image;

  DataEntity({
    required this.id,
    required this.pname,
    required this.size,
    required this.prize,
    required this.image,
  });
}
