import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_food_app/bloc/product_bloc.dart';
import 'package:shop_food_app/widgets/carditem.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: const Text('Toko Buah & Sayur'),
        actions: [
          Row(
            children: [
              Icon(Icons.search),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Positioned(
                    top: 3,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Center(child: Text("2")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductSuccess) {
              return GridView.builder(
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) => CardItem(
                  product: state.products[index],
                ),
              );
            }
            return Center(
              child: Text("NO DATA"),
            );
          },
        ),
      ),
    );
  }
}
