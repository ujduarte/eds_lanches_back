import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final items = _getItems();

    final products = items.where((p) => p.category == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Ed's Lanches")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (_, i) => ProductCard(product: products[i]),
      ),
    );
  }
}

List<Product> _getItems() {
  return [
    Product(id:"coca",name:"Coca-Cola 350ml",image:"https://i.imgur.com/Z2zE8Lk.jpeg",price:4.00,category:"Bebidas"),
    Product(id:"fanta",name:"Fanta 350ml",image:"https://i.imgur.com/Ya7cikO.jpeg",price:3.80,category:"Bebidas"),
    Product(id:"brig",name:"Brigadeiro",image:"https://i.imgur.com/0V7HhtT.jpeg",price:7.00,category:"Doces"),
    Product(id:"salada_frutas",name:"Salada de Frutas",image:"https://i.imgur.com/Mo6BPDN.jpeg",price:14.00,category:"Doces"),
  ];
}