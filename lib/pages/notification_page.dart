import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:konnect_app/pages/account_page.dart';
import 'package:konnect_app/pages/cart_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color.fromARGB(255, 216, 214, 214),
            child: SafeArea(
                child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                width: double.maxFinite,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                    ),
                    const Text('Notifications',style: TextStyle(fontSize: 20),),
                    Row(
                      children: [
                        GestureDetector(
                      onTap: () => Get.to(const CartPage()),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10,),
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
                      ],
                    ),
                  ],
                ),
              ),
            ]))));
  }
}
