import 'package:flutter/material.dart';
import 'package:interfaces/design_system/tokens/tokens.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Vault List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/details'),
          ),
        ],
      ),
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
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/details'),
                child: Card(child: Center(child: Text('Item $index'))),
              );
            },
          ),
        ],
      ),
    );
  }
}
