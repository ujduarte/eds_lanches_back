import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cart = CartService();

  @override
  Widget build(BuildContext context) {
    final items = cart.all();

    return Scaffold(
      appBar: AppBar(title: const Text("Carrinho")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) {
          final item = items[i];

          return ListTile(
            leading: Image.network(item['image'], width: 50),
            title: Text(item['name']),
            subtitle: Text("R\$ ${(item['price'] * item['qty']).toStringAsFixed(2)}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      cart.decrease(item['name']);
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove)),
                Text("${item['qty']}"),
                IconButton(
                    onPressed: () {
                      cart.add(item);
                      setState(() {});
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.blue.shade50,
        child: Text(
          "Total: R\$ ${cart.total().toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}