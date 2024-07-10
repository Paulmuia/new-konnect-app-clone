import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konnect_app/pages/account_page.dart';
import 'package:konnect_app/pages/cart_page.dart';
import 'package:konnect_app/pages/category_page.dart';
import 'package:konnect_app/pages/home_page.dart';
import 'package:konnect_app/widgets/cart_container.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  int selectedContainerIndex = -1;
  List<String> iconTexts = List.generate(
      10, (index) => 'Items $index'); // Dummy text for the list items

  double _containerHeight = 0;

  int itemCount = 0; // New variable to track the number of items in the cart

  // Define a function to update itemCount
  void updateItemCount(int count) {
    setState(() {
      itemCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;

    final AssetImage image = arguments['image'];
    final String price = arguments['price'];
    //final String offer = arguments['offer'];
    final String text = arguments['text'];
    final String markedPrice= arguments['markedPrice'];

    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: SafeArea(
          child: Column(
            children: [
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
                    SizedBox(
                      width: 240,
                      child: Text(text,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20))),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(const CartPage()),
                          child: Stack(
                            children: [
                              const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.green,
                                size: 35,
                              ),
                              if (itemCount > 0) // Only show the circular widget if there are items in the cart
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: Text(
                                      itemCount.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
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
              const SizedBox(height: 20),
              Container(
                height: 350,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    
                    return true;
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height - _containerHeight,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 80,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Text(
                            '    $text',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedContainerIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(
                                        width: 1,
                                        color: selectedContainerIndex == index
                                            ? Colors.green
                                            : Colors.green,
                                      ),
                                      color: selectedContainerIndex == index
                                          ? Colors.green
                                          : Colors.green,
                                    ),
                                    child: Center(
                                      child: Text(
                                        iconTexts[index],
                                        style: TextStyle(
                                          color: selectedContainerIndex == index
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Ksh $price',
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Ksh $markedPrice',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '       Description',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Food is an integral part of human culture, transcending the basic necessity for sustenance to become a symbol of identity,transcending the basic necessity for sustenance to become a symbol of identity, tradition, and art. Across the globe, diverse cuisines reflect the rich history, geography, and cultural nuances of their regions. From the aromatic spices of India to the minimalist elegance of Japanese dishes, food tells a story that is as varied and fascinating as humanity itself. Food is deeply embedded in cultural rituals and traditions. In many societies, meals are a time for family and community bonding.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(HomePage()),
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            child: const Icon(Icons.home,size: 30,),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const CategoryPage()),
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            child: const Icon(Icons.category_outlined,size: 30,),
                          ),
                        ),
                        // Pass the updateItemCount function to CartContainer
                        CartContainer(
                          height1: 40,
                          width1: 180,
                          borderRadius1: 10,
                          height2: 40,
                          width2: 180,
                          borderRadius2: 10,
                          containerColor1: Colors.green,
                          textColor1: Colors.white,
                          updateItemCount: updateItemCount,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

