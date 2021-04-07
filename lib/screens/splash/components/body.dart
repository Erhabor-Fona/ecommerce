import 'dart:convert';

//import 'package:shop_app/screens/sign_in/components/sign_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String authorization;
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
  void initState() {
    // TODO: implement initState
    getData();
  }

  void getData() async {
    SharedPreferences accesstoken = await SharedPreferences.getInstance();
    setState(() {
      authorization = accesstoken.getString('accessToken');
    });
  }

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
                        makeGetRequestForProperties();
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

Future<List> makeGetRequestForProperties() async {
  SharedPreferences accesstoken = await SharedPreferences.getInstance();

  String authorization = accesstoken.getString('accessToken');
  print(authorization);
  String properties = '/properties';
  Response response = await get(url + properties, headers: {
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
  var numberOfProperties = jsonDecode(response.body);
  final length = numberOfProperties.length;
  for (var i = 0; i < length; i++) {
    String decodedName = jsonDecode(json)[i]['name'].toString();
    //print(decodedName);
    //print(length);
    var decodedImage = jsonDecode(json)[i]['images'];
    List<String> images = List<String>.from(decodedImage);
    var decodedId = jsonDecode(json)[i]['id'].toString();
    // print(decodedImage);
    var decodedDescription = jsonDecode(json)[i]['description'].toString();
    var decodedPrice = jsonDecode(json)[i]['pricing']['price'].toString();
    var decodedLiked = jsonDecode(json)[i]['liked'];
    var decodedTags = jsonDecode(json)[i]['tags'];
    var decodedLikesCount = jsonDecode(json)[i]['likes_count'];

    if (decodedLiked == true) {
      print(favouriteProduct);
      favouriteProduct.add(Product(
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

    demoProducts.add(Product(
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

  // print(demoProducts);
  print(favouriteProduct);
  // print(statusCode);
  // return response.body;
  // TODO convert json to object...
}

List<Product> demoProducts = [];
List<Product> favouriteProduct = [];

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
