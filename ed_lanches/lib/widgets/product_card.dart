import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = CartService();

    return GestureDetector(
      onTap: () {
        cart.add(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${product.name} adicionado!"))
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.network(product.image, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Text(product.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("R\$ ${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}