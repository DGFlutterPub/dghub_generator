import 'package:example2/gen/product/models/product.dart';
import 'package:example2/system/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../system/states/pagination_state.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) {
      insertProductToDatabase(Product(
          id: 2,
          name: 'name',
          description: 'description',
          price: 2000,
          page: 1,
          isSynced: true));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paginatedState = ref.watch(paginatedProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: paginatedState.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: paginatedState.products.length + 1,
              itemBuilder: (context, index) {
                if (index == paginatedState.products.length) {
                  if (!paginatedState.isLoadMoreLoading) {
                    return ElevatedButton(
                      onPressed: () =>
                          ref.read(paginatedProvider.notifier).loadNextPage(),
                      child: Text('Load More'),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }

                final product = paginatedState.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text("\$${product.price}"),
                );
              },
            ),
    );
  }
}
