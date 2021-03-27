import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/screens/splash/components/body.dart';

import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: Column(
                  children: [
                    ...List.generate(
                      demoProducts.length,
                      (index) {
                        // if (demoProducts[index].isPopular)
                        return ProductCard(product: demoProducts[index]);

                        return SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
