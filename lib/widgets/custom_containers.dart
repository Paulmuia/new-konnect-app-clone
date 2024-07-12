import 'package:flutter/material.dart';

class CustomContainers extends StatelessWidget {

  final Icon icon;
  final Text text;
  final Icon icon1;
  const CustomContainers({super.key, required this.icon, required this.text, required this.icon1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin:const  EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            
            children: [
              icon,
              const SizedBox(width: 30,),
              text
            ],
          ),
          icon1
        ],
      ),
    );
  }
}