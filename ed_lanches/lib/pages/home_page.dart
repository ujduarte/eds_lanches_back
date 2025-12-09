import 'package:flutter/material.dart';
import 'category_page.dart';
import 'category_salgados_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = [
    const CategorySalgadosPage(),
    const CategoryPage(category: "Bebidas"),
    const CategoryPage(category: "Doces"),
    const CartPage(),
  ];

  final bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Salgados"),
    BottomNavigationBarItem(icon: Icon(Icons.local_drink), label: "Bebidas"),
    BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Doces"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrinho"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: bottomItems,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}