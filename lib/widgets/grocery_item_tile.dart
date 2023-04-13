import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  const GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                height: 100,
              ),
              Text(itemName),
              MaterialButton(
                onPressed: onPressed,
                color: color,
                child: Text(
                  '\$$itemPrice',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
