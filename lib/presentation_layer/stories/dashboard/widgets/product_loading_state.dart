import 'package:flutter/material.dart';

class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
