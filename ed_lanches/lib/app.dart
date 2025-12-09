import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class EdLanchesApp extends StatelessWidget {
  const EdLanchesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ed's Lanches",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}