// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/screens/splash/components/body.dart';

// import 'package:shop_app/variables.dart';

import '../../../size_config.dart';
import 'section_title.dart';

// List<Product> demoProducts = [];
// List<Product> favouriteProduct = [];

@override
void initState() {
  // makeGetRequestForProperties();
}

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
        )
      ],
    );
  }
}

// makeGetRequestForProperties() async {
//   SharedPreferences accesstoken = await SharedPreferences.getInstance();
//
//   String authorization = accesstoken.getString('accessToken');
//   print(authorization);
//   String properties = '/properties';
//   Response response = await get(url + properties, headers: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $authorization'
//   });
//   // sample info available in response
//   int statusCode = response.statusCode;
//   Map<String, String> headers = response.headers;
//   String contentType = headers['content-type'];
//   String json = response.body;
//
//   print(json);
//   var numberOfProperties = jsonDecode(response.body);
//   final length = numberOfProperties.length;
//   for (var i = 0; i < length; i++) {
//     String decodedName = jsonDecode(json)[i]['name'].toString();
//     //print(decodedName);
//     //print(length);
//     var decodedImage = jsonDecode(json)[i]['images'];
//     List<String> images = List<String>.from(decodedImage);
//     var decodedId = jsonDecode(json)[i]['id'].toString();
//     // print(decodedImage);
//     var decodedDescription = jsonDecode(json)[i]['description'].toString();
//     var decodedPrice = jsonDecode(json)[i]['pricing']['price'].toString();
//     var decodedLiked = jsonDecode(json)[i]['liked'];
//     var decodedTags = jsonDecode(json)[i]['tags'];
//     var decodedLikesCount = jsonDecode(json)[i]['likes_count'];
//
//     if (decodedLiked == true) {
//       print(favouriteProduct);
//       favouriteProduct.add(Product(
//         images: images,
//         id: decodedId,
//         description: decodedDescription,
//         name: decodedName,
//         price: decodedPrice,
//         liked: decodedLiked,
//         likes_count: decodedLikesCount,
//         // tags: decodedTags
//       ));
//     }
//
//     demoProducts.add(Product(
//       images: images,
//       id: decodedId,
//       description: decodedDescription,
//       name: decodedName,
//       price: decodedPrice,
//       liked: decodedLiked,
//       likes_count: decodedLikesCount,
//       // tags: decodedTags
//     ));
//   }
//
//   // print(demoProducts);
//   print(favouriteProduct);
//   // print(statusCode);
//
//   // TODO convert json to object...
// }

//   Future getProperties() async {
//     String properties = '/properties';
//     Response response = await get(url + properties);
//     if (response.statusCode == 200) {
//       String data = response.body;
//       return jsonDecode(data);
//     } else {
//       print(response.statusCode);
//     }
// }
