import 'package:clean_architecture/core/app_size.dart';
import 'package:clean_architecture/core/app_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/product_tile.dart';
import 'widgets/products.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.fressery,
          style: const TextStyle(
            fontSize: AppSize.title,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //product
            const Products(),
            const SizedBox(height: 24),
            //catergories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.catergoriesLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: AppSize.subTitle,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.viewAll,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: AppSize.secondaryButton,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
