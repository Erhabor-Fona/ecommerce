// import 'package:flutter/material.dart';
// import 'package:shop_app/screens/Story Building/Components/model.dart';
// import 'package:shop_app/screens/Story Building/Components/product_card.dart';
//
// import '../../../size_config.dart';
// import 'section_title.dart';
//
// class PopularProducts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//           child: SectionTitle(title: "Story Building Products", press: () {}),
//         ),
//         SizedBox(height: getProportionateScreenWidth(20)),
//         SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ...List.generate(
//                 storyBuildings.length,
//                 (index) {
//                   if (storyBuildings[index].isPopular)
//                     return ProductCard(storyProduct: storyBuildings[index]);
//
//                   return SizedBox
//                       .shrink(); // here by default width and height is 0
//                 },
//               ),
//               SizedBox(width: getProportionateScreenWidth(20)),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
