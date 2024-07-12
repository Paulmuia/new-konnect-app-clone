import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konnect_app/controllers/cart_controller.dart';
import 'package:konnect_app/pages/Authentication/login.dart';
import 'package:konnect_app/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBxIXikq1R1wWWkDXN9cSNuiWrJIucm4oY",
      appId: "1:531611479653:android:17c69baf64a001f74fe08c",
      messagingSenderId: "531611479653",
      projectId: "konnect-clone-d458e",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:   Login(),
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
      }),
    );
  }
}
