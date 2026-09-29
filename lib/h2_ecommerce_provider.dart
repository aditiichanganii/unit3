import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final String id;
  final String name;
  final double price;
  Product(this.id, this.name, this.price);
}

class H2CartProvider extends ChangeNotifier {
  final List<Product> _items = [];
  List<Product> get items => _items;

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get total => _items.fold(0, (sum, p) => sum + p.price);
}

class H2EcommerceProvider extends StatelessWidget {
  const H2EcommerceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => H2CartProvider(),
      child: const H2ProductListScreen(),
    );
  }
}

class H2ProductListScreen extends StatelessWidget {
  const H2ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(8, (i) => Product("$i", "Item ${i + 1}", (i + 1) * 15.0));
    final cart = context.watch<H2CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini E-Commerce"),
        actions: [
          IconButton(
            icon: Badge(label: Text("${cart.items.length}"), child: const Icon(Icons.shopping_cart)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                    value: context.read<H2CartProvider>(),
                    child: const H2CheckoutScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(p.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("\$${p.price}"),
                ElevatedButton(
                  onPressed: () => context.read<H2CartProvider>().add(p),
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class H2CheckoutScreen extends StatelessWidget {
  const H2CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<H2CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout Summary")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(cart.items[i].name),
                trailing: Text("\$${cart.items[i].price}"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Total Amount: \$${cart.total}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () {
              cart.clear();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Order Placed Successfully!")));
              Navigator.pop(context);
            },
            child: const Text("Place Order"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
