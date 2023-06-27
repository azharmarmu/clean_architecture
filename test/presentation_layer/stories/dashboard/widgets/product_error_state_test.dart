import 'package:clean_architecture/data_layer/models/product_response_model.dart';
import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:clean_architecture/presentation_layer/stories/dashboard/widgets/product_error_state.dart';
import 'package:clean_architecture/presentation_layer/stories/dashboard/widgets/product_loading_state.dart';
import 'package:clean_architecture/presentation_layer/stories/dashboard/widgets/product_success_state.dart';
import 'package:clean_architecture/presentation_layer/stories/dashboard/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest(Widget child) => MaterialApp(
        home: child,
      );
  group(
    'Error state',
    () {
      testWidgets(
        'Error State UI',
        (WidgetTester tester) async {
          await tester.pumpWidget(widgetUnderTest(const ProductErrorWidget()));

          // final text = find.byWidget(const Text('Failed to fetch data'));

          final text = find.text('Failed to fetch data');

          final textType = find.byType(Text);



          expect(text, findsOneWidget);
          expect(textType, findsOneWidget);
        },
      );

      testWidgets(
        'Loading State UI',
        (WidgetTester tester) async {
          await tester
              .pumpWidget(widgetUnderTest(const ProductLoadingWidget()));

          final textType = find.byType(CircularProgressIndicator);
          expect(textType, findsOneWidget);
        },
      );

      group(
        'Success State UI',
        () {
          testWidgets(
            'When Entity is Empty',
            (WidgetTester tester) async {
              await tester.pumpWidget(
                widgetUnderTest(
                  const ProductSuccessWidget(
                    enitity: ProductResponseEntity(data: []),
                  ),
                ),
              );

              final key = find.byKey(const ValueKey('success_product'));
              expect(key, findsOneWidget);

              final productTileWidget = find.byType(ProductTile);
              expect(productTileWidget, findsNothing);
            },
          );

          testWidgets(
            'When Entity has Single Data',
            (WidgetTester tester) async {
              await tester.pumpWidget(
                widgetUnderTest(
                  ProductSuccessWidget(
                    enitity: ProductResponseModel.fromJson(fakeData),
                  ),
                ),
              );

              final key = find.byKey(const ValueKey('success_product'));
              expect(key, findsOneWidget);

              final productTileWidget = find.byType(ProductTile);
              expect(productTileWidget, findsOneWidget);


              
            },
          );

          //TODO multiple list
        },
      );
    },
  );
}

Map<String, dynamic> fakeData = {
  "status": true,
  "message": "Prodcts list .",
  "data": [
    {
      "id": "1",
      "pname": "Raw Apple",
      "size": "200ml",
      "prize": "109",
      "image":
          "http://iroidtechnologies.in/Fressery/assets/images/image_three.png"
    },
    // {
    //   "id": "2",
    //   "pname": "Specil Lassi",
    //   "size": "200ml",
    //   "prize": "550",
    //   "image":
    //       "http://iroidtechnologies.in/Fressery/assets/images/image_two.png"
    // },
  ]
};
