import 'package:flutter/material.dart';

class ChangeColor extends ChangeNotifier {
  final List<Map<String, dynamic>> items = [
    {
      "Icon": const Icon(Icons.smartphone),
      "Name": "smartphone",
      "Price": 1000.0,
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.headphones),
      "Name": "headphones",
      "Price": 200.0,
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.laptop),
      "Name": "laptop",
      "Price": 1500.0,
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.watch),
      "Name": "watch",
      "Price": 300.0,
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.camera),
      "Name": "camera",
      "Price": 500.0,
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.tablet),
      "Name": "tablet",
      "Price": 800.0,
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.tv),
      "Name": "tv",
      "Price": 1200.0,
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.speaker),
      "Name": "speaker",
      "Price": 150.0,
      "isAdded": false,
    },
  ];

  List<Map<String, dynamic>> get cartItems {
    return items.where((item) => item["isAdded"] == true).toList();
  }

  double get totalPrice {
    return cartItems.fold(
      0.0,
      (total, item) => total + (item["Price"] as double),
    );
  }

  void changeColor(int index) {                                                                                           
    items[index]["isAdded"] = !items[index]["isAdded"];
    notifyListeners();
  }
}
