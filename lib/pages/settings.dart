import 'package:flutter/material.dart';
import 'package:konnect_app/pages/account_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:konnect_app/pages/Authentication/login.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    const Text('Settings',style: TextStyle(fontSize: 20),),
                    Row(
                      children: [
                       
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
              const SizedBox(height: 300,),
              Center(
                          child: GestureDetector(
                            onTap: _logout,
                            child: Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green,
                              ),
                              child: const Center(
                                child: Text(
                                        'Log Out',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
            ]))));
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isSignedUp');

    Get.offAll(() => const Login());
  }
}
