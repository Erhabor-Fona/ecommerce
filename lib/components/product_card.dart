//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
//import 'package:shop_app/screens/home/components/popular_product.dart';
import 'package:shop_app/variables.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool liked = false;
  //int statusCode;
  int likes_count;
  // void _toggleFavorite() {
  //   setState(() {
  //     var statusCode = _makePostRequest();
  //     print(liked);
  //
  //     if (liked == true) {
  //       liked = false;
  //       likes_count -= 1;
  //       print(liked);
  //
  //       print(statusCode);
  //     } else {
  //       liked = true;
  //       likes_count += 1;
  //       print(liked);
  //     } // ignore: unrelated_type_equality_checks
  //   });
  // }

  @override
  void initState() {
    // makeGetRequestForProperties();

    // TODO: implement initState
    super.initState();

    // const fiveSec = const Duration(seconds: 5);
    // Timer.periodic(fiveSec, (timer) {
    //   makeGetRequestForProperties();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: widget.product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  margin:
                      EdgeInsets.only(right: getProportionateScreenWidth(20)),
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.product.id.toString(),
                    child: Image.network(widget.product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.name,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(getProportionateScreenWidth(8)),
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      // decoration: BoxDecoration(
                      //   color: product.isFavourite
                      //       ? kPrimaryColor.withOpacity(0.15)
                      //       : kSecondaryColor.withOpacity(0.1),
                      //   shape: BoxShape.circle,
                      // ),
                      child: SvgPicture.asset(
                        "assets/icons/visibility.svg",
                        // color: product.isFavourite
                        //     ? Color(0xFFFF4848)
                        //     : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                            padding: EdgeInsets.all(0),
                            alignment: Alignment.centerRight,
                            icon: Icon(Icons.star),
                            iconSize: 30.0,
                            color: widget.product.liked
                                ? Colors.red[500]
                                : Colors.black45,
                            onPressed: () {
                              setState(() {
                                var statusCode = _makePostRequest();
                                print(widget.product.liked);
                                widget.product.liked = !widget.product.liked;
                                if (widget.product.liked) {
                                  widget.product.likes_count += 1;
                                } else {
                                  widget.product.likes_count -= 1;
                                }
                                // if (statusCode == 200) {
                                //   widget.product.liked = true;
                                // } else {
                                //   widget.product.liked = false;
                                // }
                              });
                            }
                            //_toggleFavorite,
                            ),
                      ),
                      SizedBox(
                        width: 18,
                        child: Container(
                          child: Text("${widget.product.likes_count}"),
                        ),
                      ),
                    ],
                  ),

                  // Favourite(product.id),
                  // InkWell(
                  //   borderRadius: BorderRadius.circular(50),
                  //   onTap: () {},
                  //   child: Container(
                  //     margin: EdgeInsets.all(getProportionateScreenWidth(8)),
                  //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                  //     height: getProportionateScreenWidth(28),
                  //     width: getProportionateScreenWidth(28),
                  //     // decoration: BoxDecoration(
                  //     //   color: product.isFavourite
                  //     //       ? kPrimaryColor.withOpacity(0.15)
                  //     //       : kSecondaryColor.withOpacity(0.1),
                  //     //   shape: BoxShape.circle,
                  //     // ),
                  //     child: SvgPicture.asset(
                  //       "assets/icons/Heart Icon_2.svg",
                  //       // color: product.isFavourite
                  //       //     ? Color(0xFFFF4848)
                  //       //     : Color(0xFFDBDEE4),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<int> _makePostRequest() async {
    String id = widget.product.id;
    print(id);
    SharedPreferences accesstoken = await SharedPreferences.getInstance();
    String authorization = accesstoken.getString('accessToken');
    String extension = '/properties/$id/like';

    print(id);
    Map<String, String> headers = {"Content-type": "application/json"};
    Response response = await post(url + extension,
        headers: {'Authorization': 'Bearer $authorization'});
    // check the status code for the result
    int statusCode = response.statusCode;

    // this API passes back the id of the new item added to the body
    String body = response.body;

    print(body);

    return statusCode;
  }
}
