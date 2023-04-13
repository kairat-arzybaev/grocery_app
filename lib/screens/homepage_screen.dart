import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart.dart';

import 'package:grocery_app/widgets/grocery_item_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            )),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            // good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good Morning'),
            ),

            const SizedBox(
              height: 4,
            ),
            // lets order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Let\'s order fresh items for you',
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 3,
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            // fresh items grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fresh items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<Cart>(
                builder: (context, value, child) {
                  return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: value.shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                      itemBuilder: ((context, index) => GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .addItemToCart(index);
                          })));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
