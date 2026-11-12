import 'package:flutter/material.dart';
import 'package:market/Pages/CartPage.dart';
import 'package:market/Provider/ChangeColor.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final List items = [
    {
      "Icon": const Icon(Icons.smartphone),
      "Name": "smartphone",
      "Price": "\$1000",
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.headphones),
      "Name": "headphones",
      "Price": "\$200",
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.laptop),
      "Name": "laptop",
      "Price": "\$1500",
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.watch),
      "Name": "watch",
      "Price": "\$300",
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.camera),
      "Name": "camera",
      "Price": "\$500",
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.tablet),
      "Name": "tablet",
      "Price": "\$800",
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.tv),
      "Name": "tv",
      "Price": "\$1200",
      "isAdded": false,
    },
    {
      "Icon": const Icon(Icons.speaker),
      "Name": "speaker",
      "Price": "\$150",
      "isAdded": false,
    },
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final changeColorobject = context.watch<ChangeColor>();
    return Scaffold(
      appBar: AppBar(title: Text("shopping app")),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: changeColorobject.items.length,
          itemBuilder: (context, index) {
            final item = changeColorobject.items[index];
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  item["Icon"],
                  Text(item["Name"]),
                  Text(item["Price"]),

                  ElevatedButton(
                    onPressed: () {
                      changeColorobject.changeColor(index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: changeColorobject.items[index]["isAdded"]
                          ? Colors.black
                          : Colors.cyanAccent,
                    ),
                    child: Text(
                      changeColorobject.items[index]["isAdded"]
                          ? "Added"
                          : "Add to cart",
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cartpage()),
          );
        },

        tooltip: 'Increment',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
