import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/variables.dart';

import '../../../components/default_button.dart';
// This is the best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Flat Mate, Let’s Find you a building!",
      "image": "assets/images/undraw1.png"
    },
    {
      "text": "We help people conect with properties \naround Nigeria",
      "image": "assets/images/undraw2.png"
    },
    {
      "text":
          "We show the easy way to get a new building. \nJust stay at home with us",
      "image": "assets/images/undraw3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        _makeGetRequest();
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

List<Product> demoProducts = [];
_makeGetRequest() async {
  // make GET request
  String properties = '/properties';
  Response response = await get(url + properties);
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  // print(json);
  var numberOfProperties = jsonDecode(response.body);
  final length = numberOfProperties.length;
  for (var i = 0; i < length; i++) {
    String decodedName = jsonDecode(json)[i]['name'].toString();
    print(decodedName);
    print(length);
    var decodedImage = jsonDecode(json)[i]['images'];
    List<String> images = List<String>.from(decodedImage);
    var decodedId = jsonDecode(json)[i]['id'].toString();
    // print(decodedImage);
    var decodedDescription = jsonDecode(json)[i]['description'].toString();
    var decodedPrice = jsonDecode(json)[1]['price'].toString();
    demoProducts.add(Product(
        images: images,
        id: decodedId,
        description: decodedDescription,
        name: decodedName,
        price: decodedPrice));
  }

  print(demoProducts);
  //demoProducts = [
  // Product(
  //   id: 1,
  //   images: [
  //     "assets/images/product3.png",
  //     "assets/images/product3.png",
  //     "assets/images/product3.png",
  //     "assets/images/product3.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "Duplex™",
  //   // price: 64.99,
  //   description: description,
  //   // rating: 4.8,
  //   // isFavourite: true,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 2,
  //   images: [
  //     "assets/images/product2.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "Bungalow",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 3,
  //   images: [
  //     "assets/images/product1.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "PentHouse",
  //   // price: 36.55,
  //   description: description,
  //   // rating: 4.1,
  //   // isFavourite: true,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 4,
  //   images: [
  //     "assets/images/product3.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building X",
  //   // price: 20.20,
  //   description: description,
  //   // rating: 4.1,
  //   // isFavourite: true,
  // ),
  // Product(
  //   id: 5,
  //   images: [
  //     "assets/images/product7.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building2",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 6,
  //   images: [
  //     "assets/images/product8.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building3",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 7,
  //   images: [
  //     "assets/images/product9.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building4",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 8,
  //   images: [
  //     "assets/images/product10.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building5",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 9,
  //   images: [
  //     "assets/images/product11.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building6",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 10,
  //   images: [
  //     "assets/images/product13.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building11",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // Product(
  //   id: 11,
  //   images: [
  //     "assets/images/product1.png",
  //   ],
  //   colors: [
  //     // Color(0xFFF6625E),
  //     // Color(0xFF836DB8),
  //     // Color(0xFFDECB9C),
  //     // Colors.white,
  //   ],
  //   name: "building12",
  //   // price: 50.5,
  //   description: description,
  //   // rating: 4.1,
  //   // isPopular: true,
  // ),
  // ];

  // print(statusCode);

  // TODO convert json to object...
}

Future getProperties() async {
  String properties = '/properties';
  Response response = await get(url + properties);
  if (response.statusCode == 200) {
    String data = response.body;
    return jsonDecode(data);
  } else {
    print(response.statusCode);
  }
}
