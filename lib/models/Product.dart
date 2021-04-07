import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name, description;
  final List<String> images;
  final List<String> tags;
  final List<Color> colors;
  // final double rating,
  final String price;
  bool liked;
  int likes_count;

  //final bool isFavourite, isPopular;

  Product({
    @required this.id,
    this.likes_count,
    this.tags,
    this.images,
    this.colors,
    this.liked,
    // this.rating = 0.0,
    // this.isFavourite = false,
    //  this.isPopular = false,
    @required this.name,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

const String description = "Nice Building at the country side";
// _makeGetRequest() async {
//   // make GET request
//   String url = 'https://jsonplaceholder.typicode.com/posts';
//   Response response = await get(url);
//   // sample info available in response
//   int statusCode = response.statusCode;
//   Map<String, String> headers = response.headers;
//   String contentType = headers['content-type'];
//   String json = response.body;
//   // TODO convert json to object...
// }
