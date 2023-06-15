import 'package:clean_architecture/presentation_layer/bloc/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_size.dart';
import '../../../../core/app_strings.dart';
import 'product_loading_state.dart';
import 'product_success_state.dart';
import 'product_error_state.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.productLabel,
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
        BlocBuilder<ProductCubit, ProductState>(
          bloc: ProductCubit()..fetchProducts(),
          builder: (BuildContext context, ProductState state) {
            if (state is ProductLoadingState) {
              return const ProductLoadingWidget();
            } else if (state is ProductSuccessState) {
              return ProductSuccessWidget(enitity: state.entity);
            } else if (state is ProductFailureState) {
              return const ProductErrorWidget();
            }
            return const SizedBox.shrink();
          },
        ),

        //intial loading
        //
        //after we fetch data from api
      ],
    );
  }
}
