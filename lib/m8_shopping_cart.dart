import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  CartItem({required this.id, required this.name, required this.price});
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}

class M8ShoppingCart extends StatelessWidget {
  const M8ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Shopping Cart")),
        body: Column(
          children: [
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text("\$${item.price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () => cart.removeItem(item.id),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<CartProvider>(
              builder: (context, cart, child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Total: \$${cart.totalPrice.toStringAsFixed(2)}", 
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Dummy add
              },
              child: Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    final cart = Provider.of<CartProvider>(context, listen: false);
                    cart.addItem(CartItem(
                      id: DateTime.now().toString(),
                      name: "Product ${cart.items.length + 1}",
                      price: 25.0,
                    ));
                  },
                  child: const Text("Add Random Product (\$25)"),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
