// import 'dart:convert';
//
// // get reponse from API
// import 'package:http/http.dart' as http;
// import 'package:shop_app/models/Product.dart';
//
// // API url
// String url = "http://138.68.98.220:8080/properties";
//
// // Here we are using http package to fetch data from API
// // We defined return type BeerListModel
// Future<Product> getPropertiesListData() async {
//   final response = await http.get(
//     url,
//   );
//   //json.decode used to decode response.body(string to map)
//   return Product(id: null, name: null, price: null, description: null)
//       .fromJson(json.decode(response.body));
// }
