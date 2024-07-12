import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt itemCount = 0.obs;

  void addToCart() {
    itemCount.value++; // Increment itemCount
  }

  void removeFromCart() {
    if (itemCount.value > 0) {
      itemCount.value--; // Decrement itemCount, if it's greater than 0
    }
  }
}
