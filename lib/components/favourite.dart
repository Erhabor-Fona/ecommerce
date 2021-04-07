// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:shop_app/variables.dart';
//
// class Favourite extends StatefulWidget {
//   @override
//   _FavouriteState createState() => _FavouriteState();
// }
//
// class _FavouriteState extends State<Favourite> {
//   bool _isFavorited = true;
//   int _favoriteCount = 41;
//   Product product;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: EdgeInsets.all(0),
//           child: IconButton(
//             padding: EdgeInsets.all(0),
//             alignment: Alignment.centerRight,
//             icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
//             color: Colors.red[500],
//             onPressed: _toggleFavorite,
//           ),
//         ),
//         SizedBox(
//           width: 18,
//           child: Container(
//             child: Text('$_favoriteCount'),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorited) {
//         var statusCode = _makePostRequest();
//         _favoriteCount -= 1;
//         _isFavorited = false;
//         print(statusCode);
//       } else {
//         var statusCode = _makePostRequest();
//         _favoriteCount += 1;
//         _isFavorited = true;
//       }
//     });
//   }
//
//   Future<int> _makePostRequest() async {
//     String id =widget product.id;
//     SharedPreferences accesstoken = await SharedPreferences.getInstance();
//     String authorization = accesstoken.getString('accessToken');
//     String extension = '/properties/$id/like';
//     print(product);
//     print(id);
//     Map<String, String> headers = {"Content-type": "application/json"};
//     Response response = await post(url + extension,
//         headers: {'Authorization': 'Bearer $authorization'});
//     // check the status code for the result
//     int statusCode = response.statusCode;
//
//     // this API passes back the id of the new item added to the body
//     String body = response.body;
//
//     print(body);
//
//     return statusCode;
//   }
// }
