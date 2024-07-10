import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konnect_app/pages/account_page.dart';
import 'package:konnect_app/pages/notification_page.dart';
import 'package:konnect_app/pages/search_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 216, 214, 214),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 55,
                width: double.maxFinite,
                color: Colors.white,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(const AccountPage()),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.green,
                        child: Text(
                          'MP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Image(
                        width: 150,
                        height: 40,
                        image: AssetImage('assets/images/logo.png')),
                    GestureDetector(
                      onTap: () {
                        Get.to( SearchPage());
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const NotificationPage()),
                      child: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const  SizedBox(height: 360,),
              const Center(child: Text('This is the Cart page'),)
    ]))));
  }
}