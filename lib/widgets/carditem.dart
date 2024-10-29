// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_food_app/models/product.dart';
import 'package:shop_food_app/pages/detail_page.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: product,))),
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: product.id,
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(product.images[0], fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              "USD ${product.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff72B67D),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_checkout_rounded,
                    color: Color(0xff72B67D),
                  ),
                ),
                Text(
                  "Beli",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff72B67D),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_circle_outline_outlined,
                  ),
                ),
                Text(
                  "1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
