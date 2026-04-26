import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';

import 'Student.dart';
import 'package:flutter/material.dart';

//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double sum = 0;
  List<Map<String, dynamic>> carts = [];
  List<Map<String, dynamic>> stores = [
    {
      "name": "Nike Air Max",
      "price": 120000,
      "img":
          "https://images.unsplash.com/photo-1605348532760-6753d2c43329?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Adidas",
      "price": 200000,
      "img":
          "https://images.unsplash.com/photo-1651013691313-81b822df0044?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Nike Air Max 1",
      "price": 150000,
      "img":
          "https://images.unsplash.com/photo-1608231387042-66d1773070a5?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Nike Air Max 2",
      "price": 250000,
      "img":
          "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Nike Air Max 3",
      "price": 500000,
      "img":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];
  Widget _buildItemWidget({
    required String name,
    required String img,
    required int price,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(img, width: 120, height: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Text(
              price.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            ElevatedButton(
              onPressed: () {
                dynamic findProduct = carts.firstWhere(
                  (item) => item['name'] == name,
                  orElse: () => {
                    "name": name,
                    "price": price,
                    "img": img,
                    "quality": 0,
                  },
                );
                if (findProduct['quality'] == 0) {
                  findProduct['quality'] = 1;
                  carts.add(findProduct);
                } else {
                  findProduct['quality']++;
                }
                setState(() {
                  sum = 0;
                  carts.forEach((item) {
                    sum += item['price'] * item['quality'];
                  });
                });
              },
              child: Text("Thêm vào giỏ hàng"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String name,
    required String img,
    required int quality,
    required int price,
  }) {
    return ListTile(
      leading: CircleAvatar(radius: 35, backgroundImage: NetworkImage(img)),
      title: Text(name),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('GIá: ${price.toString()}'),
          Text('Số lượng: ${quality.toString()}'),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            carts.removeWhere((item) => item['name'] == name);
            sum = 0;
            carts.forEach((item) {
              sum += item['price'] * item['quality'];
            });
          });
        },
        icon: Icon(Icons.remove_circle, color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Shoe Store',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Giỏ hàng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: carts.isEmpty
                    ? Center(
                        child: Text(
                          'Chưa có sản phẩm trong giỏ hàng',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : ListView(
                        scrollDirection: Axis.vertical,
                        children: carts
                            .map(
                              (e) => _buildCartItem(
                                name: e['name'],
                                img: e['img'],
                                price: e['price'],
                                quality: e['quality'],
                              ),
                            )
                            .toList(),
                      ),
              ),
              Text(
                "Tổng số tiền là: ${sum} VNĐ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5),
              Text(
                'Danh Sách Sản phẩm',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 290,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: stores
                      .map(
                        (e) => _buildItemWidget(
                          name: e['name'],
                          img: e['img'],
                          price: e['price'],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
