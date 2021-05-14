import 'package:flutter/material.dart';
import 'package:shop_app/screens/Story Building/Components/body.dart';
import 'package:shop_app/screens/Story Building/Components/model.dart';

import 'Components/custom_app_bar.dart';
//import 'components/custom_app_bar.dart';

class StoryDetailsScreen extends StatelessWidget {
  static String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: agrs.storyProduct.rating),
      body: Body(storyProduct: agrs.storyProduct),
    );
  }
}

class ProductDetailsArguments {
  final StoryProduct storyProduct;

  ProductDetailsArguments({@required this.storyProduct});
}
