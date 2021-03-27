import 'package:flutter/material.dart';

class StoryProduct {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  StoryProduct({
    @required this.id,
    @required this.images,
    this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<StoryProduct> storyBuildings = [
  StoryProduct(
    id: 1,
    images: [
      "assets/images/product3.png",
      "assets/images/product3.png",
      "assets/images/product3.png",
      "assets/images/product3.png",
    ],
    colors: [],
    title: "Bungalow A™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  StoryProduct(
    id: 2,
    images: [
      "assets/images/product2.png",
    ],
    colors: [],
    title: "Bungalow B",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  StoryProduct(
    id: 3,
    images: [
      "assets/images/product1.png",
    ],
    colors: [],
    title: "Bungalow C",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  StoryProduct(
    id: 4,
    images: [
      "assets/images/product3.png",
    ],
    colors: [],
    title: "Bungalow D",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  StoryProduct(
    id: 5,
    images: [
      "assets/images/product7.png",
    ],
    colors: [],
    title: "Bungalow E",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  StoryProduct(
    id: 6,
    images: [
      "assets/images/product8.png",
    ],
    colors: [],
    title: "Bungalow F",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  StoryProduct(
    id: 7,
    images: [
      "assets/images/product9.png",
    ],
    colors: [],
    title: "Bungalow G",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  StoryProduct(
    id: 8,
    images: [
      "assets/images/product10.png",
    ],
    colors: [],
    title: "Bungalow H",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  StoryProduct(
    id: 9,
    images: [
      "assets/images/product11.png",
    ],
    colors: [],
    title: "Bungalow I",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  StoryProduct(
    id: 10,
    images: [
      "assets/images/product13.png",
    ],
    colors: [],
    title: "Bungalow J",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  StoryProduct(
    id: 11,
    images: [
      "assets/images/product1.png",
    ],
    colors: [],
    title: "Bungalow K",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
];

const String description = "Nice Building at the country side";
