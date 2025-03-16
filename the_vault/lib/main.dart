import 'package:flutter/material.dart';
import 'package:the_vault/ui/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vault ',
      home: HomeScreen(),
    );
  }
}
