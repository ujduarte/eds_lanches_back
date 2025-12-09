import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class CategorySalgadosPage extends StatelessWidget {
  const CategorySalgadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final salgados = [
      Product(id:"kibe",name:"Kibe",image:"https://i.imgur.com/DTpM4zF.jpeg",price:5.50,category:"Salgados"),
      Product(id:"croissant",name:"Croissant de Frango",image:"https://i.imgur.com/p2wC9xf.jpeg",price:8.00,category:"Salgados"),
      Product(id:"esfiha",name:"Esfiha de Calabresa",image:"https://i.imgur.com/ZlTn81A.jpeg",price:6.00,category:"Salgados"),
      Product(id:"bauru",name:"Bauruzinho",image:"https://i.imgur.com/il84x2p.jpeg",price:7.00,category:"Salgados"),
      Product(id:"coxinha",name:"Coxinha",image:"https://i.imgur.com/VQ3DSQ8.jpeg",price:5.00,category:"Salgados"),
      Product(id:"lanche_nat",name:"Lanche Natural",image:"https://i.imgur.com/f3uYblp.jpeg",price:9.50,category:"Salgados"),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Ed's Lanches")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: salgados.length,
        itemBuilder: (_, i) => ProductCard(product: salgados[i]),
      ),
    );
  }
}