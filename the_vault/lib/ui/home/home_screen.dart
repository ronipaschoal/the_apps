import 'package:flutter/material.dart';
import 'package:interfaces/design_system/tokens/tokens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Vault')),
      body: ListView(
        padding: EdgeInsets.all(DsSpacing.xs),
        children: [
          const Center(child: Text('Search')),
          DsSpacer.sm,
          GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (_, index) {
              return Card(child: Center(child: Text('Item $index')));
            },
          ),
        ],
      ),
    );
  }
}
