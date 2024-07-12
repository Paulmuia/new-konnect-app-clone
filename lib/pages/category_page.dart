import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Simplified import for Get package

import 'package:konnect_app/pages/detailed_page.dart';

import 'package:konnect_app/widgets/cart_container.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<AssetImage> images = [
    const AssetImage('assets/images/ajabmaize.jpeg'),
    const AssetImage('assets/images/nescafe.jpeg'),
    const AssetImage('assets/images/kabras.jpeg'),
    const AssetImage('assets/images/indomie.jpeg'),
    const AssetImage('assets/images/sortcare.jpeg'),
    const AssetImage('assets/images/milk.jpeg'),
    const AssetImage('assets/images/indomie.jpeg'),
    const AssetImage('assets/images/halisi.jpg'),
    const AssetImage('assets/images/ketepa.jpeg'),
    const AssetImage('assets/images/sunlight.jpeg'),
    const AssetImage('assets/images/riri.jpeg'),
    const AssetImage('assets/images/ajabugali.jpeg'),
    const AssetImage('assets/images/minute.jpeg'),
  ];

  final List<String> texts = [
    'Ajab Wheat Flour 2kg',
    'Nescafe Classic Coffee',
    'Kabras Premium White Sugar 1kg',
    'Indomie Instant Noodles',
    'Softcare Baby Pampers',
    'Mount Kenya UHT Milk',
    'Indomie Instant Noodles',
    'Halisi Vegetable Cooking Oil',
    'Ketepa Fahari ya Kenya Tea',
    'Sunlight Washing Powder 1kg',
    'Riri Maize Flour 2kg',
    'Ajab Maize Flour 2kg',
    'Minute Maid Juice 1L',
  ];

  final List<AssetImage> icons = const [
    AssetImage('assets/images/cup.png'),
    AssetImage('assets/images/appliances.png'),
    AssetImage('assets/images/drink.png'),
    AssetImage('assets/images/personal.png'),
    AssetImage('assets/images/kids.png'),
    AssetImage('assets/images/cleaning.png'),
    AssetImage('assets/images/personal.png'),
    AssetImage('assets/images/liquor.png'),
    AssetImage('assets/images/weekly.png'),
    AssetImage('assets/images/fashion.png'),
    AssetImage('assets/images/wholesale.png'),
    AssetImage('assets/images/weekly.png'),
    AssetImage('assets/images/new.png'),
  ];
  final List<int> offers = [
    30, // Price for cup
    50, // Price for appliances
    24, // Price for drink
    32, // Price for personal item
    20, // Price for kids item
    27, // Price for cleaning item
    36, // Another personal item
    18, // Price for liquor
    35, // Price for weekly item
    10, // Price for fashion item
    40, // Price for wholesale item
    28, // Another weekly item
    16, // Price for new item
  ];

  final List<Color> colors = const [
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.amber,
    Colors.red,
    Colors.green,
    Color.fromARGB(255, 7, 247, 227),
    Color.fromARGB(255, 173, 77, 77),
    Color.fromARGB(255, 178, 20, 226),
    Color.fromARGB(255, 248, 212, 4),
    Color.fromARGB(255, 206, 42, 64),
    Color.fromARGB(255, 10, 202, 236),
    Color.fromRGBO(29, 197, 127, 0.541),
  ];

  final List<String> iconTexts = const [
    'Food Cupboard',
    'Appliances',
    'Drinks',
    'Personal Care',
    'Baby & kids',
    'Cleaning',
    'HouseHold',
    'Liquor',
    'Stationery',
    'Fashion',
    'Wholesale',
    'Weekly Offers',
    'New Products',
  ];
  final List<int> prices = [
    150, // Price for cup
    299, // Price for appliances
    120, // Price for drink
    175, // Price for personal item
    250, // Price for kids item
    300, // Price for cleaning item
    160, // Another personal item
    210, // Price for liquor
    185, // Price for weekly item
    230, // Price for fashion item
    176, // Price for wholesale item
    230, // Another weekly item
    200, // Price for new item
  ];
  final List<int> markedPrice = [
    180, // Price for cup
    350, // Price for appliances
    170, // Price for drink
    220, // Price for personal item
    290, // Price for kids item
    350, // Price for cleaning item
    220, // Another personal item
    250, // Price for liquor
    240, // Price for weekly item
    280, // Price for fashion item
    250, // Price for wholesale item
    300, // Another weekly item
    280, // Price for new item
  ];

  int _selectedIndex = -1;
  int selectedContainerIndex = -1; // Initially, no item is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 216, 214, 214),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(width: 0.1, color: Colors.green),
                      ),
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedIndex == index
                                      ? const Color.fromARGB(255, 172, 223, 113)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: colors[index],
                                      radius: 20,
                                      child: Center(
                                        child: Image(
                                          image: icons[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      iconTexts[index],
                                      style: const TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Placeholder for other content on the page
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        // Add your main content here
                        child: Column(
                          children: [
                            Container(
                              height: 75,
                              width: double.infinity,
                              color: Colors.grey[100],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    '   Food Products',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19,
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
                                                horizontal: 5, vertical: 5),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                              border: Border.all(
                                                width: 1,
                                                color: selectedContainerIndex ==
                                                        index
                                                    ? Colors.green
                                                    : Colors
                                                        .black, // Change color conditionally
                                              ),
                                              color: selectedContainerIndex ==
                                                      index
                                                  ? Colors.green
                                                  : null, // Change color conditionally
                                            ),
                                            child: Center(
                                              child: Text(
                                                iconTexts[index],
                                                style: TextStyle(
                                                  color: selectedContainerIndex ==
                                                          index
                                                      ? Colors
                                                          .white // Change text color conditionally
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                //physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: (images.length / 2).ceil(),
                                itemBuilder: (context, index) {
                                  // Calculate image indexes for the left and right containers
                                  int leftIndex = index * 2;
                                  int rightIndex = leftIndex + 1;

                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 280,
                                    margin: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.green),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 80,
                                                  height: 30,
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                      color: Colors.green),
                                                  child: Center(
                                                      child: Text(
                                                    '-Ksh ${offers[leftIndex % offers.length]}',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                GestureDetector(
                                                  onTap: () => Get.to(
                                                    const DetailedPage(),
                                                    arguments: {
                                                      'offer': offers[index]
                                                          .toString(),
                                                      'image':
                                                          images[leftIndex],
                                                      'price': prices[leftIndex]
                                                          .toString(),
                                                      'text': texts[leftIndex],
                                                      'markedPrice':
                                                          markedPrice[leftIndex]
                                                              .toString(),
                                                    },
                                                  ),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 140,
                                                    child: Image(
                                                      image: images[leftIndex %
                                                          images.length],
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  height: 90,
                                                  width: 140,
                                                  color: Colors.white,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        texts[leftIndex %
                                                            texts.length],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        //overflow: TextOverflow.ellipsis,
                                                      ),
                                                      Text(
                                                        'Ksh ${prices[leftIndex % prices.length].toStringAsFixed(2)}', // Converts the price to a string with 2 decimal places
                                                        style: const TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                      const Center(
                                                          child: CartContainer(
                                                        height1: 30,
                                                        width1: 140,
                                                        borderRadius1: 15,
                                                        containerColor1:
                                                            Colors.white,
                                                        textColor1:
                                                            Colors.green,
                                                        height2: 30,
                                                        width2: 140,
                                                        borderRadius2: 10,
                                                        borderWidth1: 1,
                                                        borderColor1:
                                                            Colors.green,
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                            width:
                                                5), // Adjust spacing between containers
                                        Expanded(
                                          child: rightIndex < images.length
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.2,
                                                        color: Colors.green),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 80,
                                                        height: 30,
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10)),
                                                            color:
                                                                Colors.green),
                                                        child: Center(
                                                            child: Text(
                                                          '-Ksh ${offers[rightIndex % offers.length]}',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        )),
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () => Get.to(
                                                          const DetailedPage(),
                                                          arguments: {
                                                            'offer':
                                                                offers[index]
                                                                    .toString(),
                                                            'image': images[
                                                                rightIndex],
                                                            'price': prices[
                                                                    rightIndex]
                                                                .toString(),
                                                            'text': texts[
                                                                rightIndex],
                                                            'markedPrice':
                                                                markedPrice[
                                                                        rightIndex]
                                                                    .toString(),
                                                          },
                                                        ),
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 140,
                                                          child: Image(
                                                            image: images[
                                                                rightIndex %
                                                                    images
                                                                        .length],
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        height: 90,
                                                        width: 140,
                                                        color: Colors.white,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              texts[rightIndex %
                                                                  texts.length],
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                              // overflow: TextOverflow.ellipsis,
                                                            ),
                                                            Text(
                                                              'Ksh ${prices[rightIndex % prices.length].toStringAsFixed(2)}', // Converts the price to a string with 2 decimal places
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                            ),
                                                            const Center(
                                                                child:
                                                                    CartContainer(
                                                              height1: 30,
                                                              width1: 140,
                                                              borderRadius1: 15,
                                                              containerColor1:
                                                                  Colors.white,
                                                              textColor1:
                                                                  Colors.green,
                                                              height2: 30,
                                                              width2: 140,
                                                              borderRadius2: 10,
                                                              borderWidth1: 1,
                                                              borderColor1:
                                                                  Colors.green,
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
