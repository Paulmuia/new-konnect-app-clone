import 'package:flutter/material.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 216, 214, 214),
        child: const SafeArea(
          child: Column(
            children: [
              
              SizedBox(height: 360,),
              Center(child: Text('This is the Cart page'),)
    ]))));
  }
}