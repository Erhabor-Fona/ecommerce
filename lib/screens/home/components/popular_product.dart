import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/variables.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'special_offers.dart';

@override
void initState() {
  // makeGetRequestForProperties();
}

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  Future<List<Product>> makeGetRequestForProperties() async {
    SharedPreferences accesstoken = await SharedPreferences.getInstance();

    String authorization = accesstoken.getString('accessToken');
    print(authorization);
    String endpoint = '/properties';
    Response response = await get(url + endpoint, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $authorization'
    });
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;

    print(json);
    var jsonData = jsonDecode(response.body);
    List<Product> properties = [];
    for (var p in jsonData) {
      String decodedName = p['name'].toString();
      var decodedImage = p['images'];
      List<String> images = List<String>.from(decodedImage);
      var decodedId = p['id'].toString();
      var decodedDescription = p['description'].toString();
      var decodedPrice = p['pricing']['price'].toString();
      var decodedLiked = p['liked'];
      var decodedTags = p['tags'];
      var decodedLikesCount = p['likes_count'];

      // if (decodedLiked == true) {
      //   print(favouriteProduct);
      //   favouriteProduct.add(Product(
      //     images: images,
      //     id: decodedId,
      //     description: decodedDescription,
      //     name: decodedName,
      //     price: decodedPrice,
      //     liked: decodedLiked,
      //     likes_count: decodedLikesCount,
      //     // tags: decodedTags
      //   ));
      // }

      properties.add(Product(
        images: images,
        id: decodedId,
        description: decodedDescription,
        name: decodedName,
        price: decodedPrice,
        liked: decodedLiked,
        likes_count: decodedLikesCount,
        // tags: decodedTags
      ));
    }

    return properties;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              DiscountBanner(),
              Categories(),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(title: "Popular Products", press: () {}),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              FutureBuilder(
                  future: makeGetRequestForProperties(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(child: Text("Loading...")),
                      );
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ...List.generate(
                              snapshot.data.length,
                              (index) {
                                // if (demoProducts[index].isPopular)
                                return ProductCard(
                                    product: snapshot.data[index]);

                                return SizedBox
                                    .shrink(); // here by default width and height is 0
                              },
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                          ],
                        ),
                      );
                    }
                  }

                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //     ...List.generate(
                  //       demoProducts.length,
                  //       (index) {
                  //         // if (demoProducts[index].isPopular)
                  //         return ProductCard(product: demoProducts[index]);
                  //
                  //         return SizedBox
                  //             .shrink(); // here by default width and height is 0
                  //       },
                  //     ),
                  //     SizedBox(width: getProportionateScreenWidth(20)),
                  //   ],
                  // ),
                  ),
              //)
            ],
          ),
        ),
      ),
    );
  }
}
