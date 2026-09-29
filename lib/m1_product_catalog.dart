import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product(this.name, this.price, this.imageUrl);
}

class M1ProductCatalog extends StatelessWidget {
  const M1ProductCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = List.generate(
      12,
      (index) => Product("Product ${index + 1}", (index + 1) * 10.0, "https://via.placeholder.com/150"),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Product Catalog")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              children: [
                Expanded(child: Image.network(product.imageUrl, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text("\$${product.price}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
