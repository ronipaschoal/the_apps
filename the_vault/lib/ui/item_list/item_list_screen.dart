import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interfaces/design_system/tokens/tokens.dart';
import 'package:the_vault/ui/item_list/cubit/item_list_cubit.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    // final itemListCubit = context.read<ItemListCubit>();

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
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(DsSpacing.xs),
        children: [
          const Center(child: Text('Search')),
          DsSpacer.sm,
          BlocBuilder<ItemListCubit, ItemListState>(
            builder: (context, state) {
              if (state is ItemListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ItemListError) {
                return Center(child: Text(state.message));
              } else if (state is ItemListLoaded) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (_, index) {
                    final item = state.items[index];
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/details'),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item.name),
                              DsSpacer.md,
                              Text(
                                item.description,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
