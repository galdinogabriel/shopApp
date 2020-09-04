import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';

enum FilterOptions {
  ShowAll,
  ShowFavorites,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha loja"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == FilterOptions.ShowFavorites) {
                  isFavorite = true;
                } else {
                  isFavorite = false;
                }
              });
            },
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  value: FilterOptions.ShowAll,
                  child: Text("Show All"),
                ),
                PopupMenuItem(
                  value: FilterOptions.ShowFavorites,
                  child: Text('Show Favorites'),
                ),
              ];
            },
          )
        ],
      ),
      body: ProductGrid(isFavorite),
    );
  }
}
