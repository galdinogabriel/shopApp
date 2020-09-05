import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/badged.dart';
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
          ),
          Consumer<Cart>(
            builder: (ctx, cart, _) => Badge(
              value: cart.itemsCount.toString(),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
              ),
            ),
          )
        ],
      ),
      body: ProductGrid(isFavorite),
    );
  }
}
