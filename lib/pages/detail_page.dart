// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_food_app/models/product.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int angka = 1;

  void increment() {
    setState(() {
      angka++;
    });
  }

  void decrement() {
    if (angka != 0) {
      setState(() {
        angka--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text('Toko Buah & Sayur'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.heart_broken_outlined,
                color: Colors.red,
              ))
        ],
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),
          ),
          Center(
            child: Hero(
              tag: widget.product.id,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.product.images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rp. ${widget.product.price}} ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 1.2, height: 1.7),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  decrement();
                },
                icon: Icon(
                  Icons.remove_circle_outline_outlined,
                  size: 30,
                ),
              ),
              Text(
                angka.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  increment();
                },
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 30,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 50,
                child: Center(
                  child: Text(
                    'Beli Sekarang',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
