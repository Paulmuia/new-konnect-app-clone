import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final int itemCount;

  const CartIcon({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.shopping_cart_outlined,size: 30,color: Colors.green,),
        if (itemCount > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                itemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}