import 'package:e_commers/providers/product_provider.dart';
import 'package:e_commers/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context, listen: true);
    provider.fetchData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: provider.products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, index) => InkWell(
                      child: Container(
                        color: Colors.green,
                        child: Column(
                          children: [
                            Image.network(provider.products[index].image,
                                height: 100, width: 100),
                            Text('Name: ${provider.products[index].name}',
                                overflow: TextOverflow.ellipsis),
                            Text('Price: ${provider.products[index].price}'),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                    product: provider.products[index])));
                      },
                    ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10)),
      ),
    );
  }
}
