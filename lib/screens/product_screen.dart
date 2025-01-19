import 'package:e_commers/providers/product_provider.dart';
import 'package:e_commers/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemCount: provider.products.isEmpty ? 5 : provider.products.length,
          itemBuilder: (context, index) {
            provider.fetchData();
            if (provider.products.isEmpty) {
              return const CircularProgressIndicator();
            }
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      provider.products[index].image,
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      'Name: ${provider.products[index].name}',
                      style: const TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Price: ${provider.products[index].price}',
                      style: const TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(product: provider.products[index]),
                  )),
            );
          }),
    );
  }
}
