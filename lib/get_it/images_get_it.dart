import 'package:flutter/material.dart';
import 'package:online_grocery/constants.dart';

class ImagesGetIt {
  List<Image> _fruits = [], _vegetables = [];

  List<Image> get getFruits => _fruits;
  List<Image> get getVegetables => _vegetables;

  initAll() {
    for (var fruit in fruits) {
      _fruits
          .add(Image.asset("assets/images/fruits/${fruit.toLowerCase()}.jpg"));
    }
    for (var vegetable in vegetables) {
      _vegetables.add(Image.asset(
          "assets/images/vegetables/${vegetable.toLowerCase()}.jpg"));
    }
  }

  cacheImages(BuildContext context) {
    for (var fruit in _fruits) {
      precacheImage(fruit.image, context);
    }
    for (var veg in _vegetables) {
      precacheImage(veg.image, context);
    }
  }
}
