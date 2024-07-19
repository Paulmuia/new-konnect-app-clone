import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.blue,
        child: Column(
        children: [
         Stack(
          children: [
            Container(
              height: 350,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/testing/food_2.png'),fit: BoxFit.cover)
              ),
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child:Container(
                width: double.maxFinite,
                height: 500,
                decoration:const  BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  color: Colors.blue
                ),
              ) ,)
          ],
         )
        ],
            ),
      ),
    );
  }
}