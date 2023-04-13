import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: value.cartItems.length,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 236, 228, 228),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Image.asset(value.cartItems[index][2]),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text(value.cartItems[index][1]),
                        trailing: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () =>
                              Provider.of<Cart>(context, listen: false)
                                  .removeItemFromCart(index),
                        ),
                      ),
                    ),
                  )),
            )),
            // total + pay now
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total price',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$${value.calculateTotal()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: const [
                          Text(
                            'Pay now',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
