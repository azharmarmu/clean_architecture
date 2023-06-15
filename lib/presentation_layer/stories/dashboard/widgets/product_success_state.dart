import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:flutter/material.dart';

import 'product_tile.dart';

class ProductSuccessWidget extends StatelessWidget {
  final ProductResponseEntity enitity;
  const ProductSuccessWidget({required this.enitity, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: enitity.data.length,
        itemBuilder: (_, int index) => ProductTile(data: enitity.data[index]),
        separatorBuilder: (_, int index) => const SizedBox(width: 16),
      ),
    );
  }
}
