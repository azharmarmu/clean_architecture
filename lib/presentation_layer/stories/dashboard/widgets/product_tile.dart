import 'package:flutter/material.dart';

import '../../../../core/app_size.dart';
import '../../../../domain_layer/entities/product_response_entity.dart';

class ProductTile extends StatelessWidget {
  final DataEntity data;
  const ProductTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 125,
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(image: NetworkImage(data.image)),
        borderRadius: BorderRadius.circular(
          AppSize.cardRadius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(data.size)),
              Flexible(child: Text('\$${data.prize}')),
            ],
          ),
          FittedBox(child: Text(data.pname)),
        ],
      ),
    );
  }
}
