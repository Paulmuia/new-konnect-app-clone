import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:konnect_app/pages/detailed_page.dart';
import 'package:konnect_app/widgets/cart_container.dart';

class VerticalFoodsListview extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (images.length / 2).ceil(),
      itemBuilder: (context, index) {
        // Calculate image indexes for the left and right containers
        int leftIndex = index * 2;
        int rightIndex = leftIndex + 1;

        return Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          margin: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.green),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(
                          const DetailedPage(),
                          arguments: {
                            'image': images[leftIndex],
                            'price': prices[leftIndex].toString(),
                            'offer': offers[index].toString(),
                            'text': texts[leftIndex],
                            'markedPrice': markedPrice[leftIndex].toString(),
                          },
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 140,
                          child: Image(
                            image: images[leftIndex % images.length],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 90,
                        width: 140,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              texts[leftIndex % texts.length],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              //overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Ksh ${prices[leftIndex % prices.length]}', // Converts the price to a string with 2 decimal places
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'Ksh ${markedPrice[leftIndex % prices.length]}', // Converts the price to a string with 2 decimal places
                                  style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            const Center(
                                child: CartContainer(
                              height1: 30,
                              width1: 140,
                              borderRadius1: 15,
                              containerColor1: Colors.white,
                              textColor1: Colors.green,
                              height2: 30,
                              width2: 140,
                              borderRadius2: 10,
                              borderWidth1: 1,
                              borderColor1: Colors.green,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5), // Adjust spacing between containers
              Expanded(
                child: rightIndex < images.length
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2, color: Colors.green),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 2,
                            ),
                            GestureDetector(
                              onTap: () => Get.to(
                                const DetailedPage(),
                                arguments: {
                                  'image': images[rightIndex],
                                  'price': prices[rightIndex].toString(),
                                  'offer': offers[index].toString(),
                                  'text': texts[rightIndex],
                                  'markedPrice':
                                      markedPrice[rightIndex].toString(),
                                },
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 140,
                                child: Image(
                                  image: images[rightIndex % images.length],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 90,
                              width: 140,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    texts[rightIndex % texts.length],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Ksh ${prices[rightIndex % prices.length]}', // Converts the price to a string with 2 decimal places
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        'Ksh ${markedPrice[rightIndex % prices.length]}', // Converts the price to a string with 2 decimal places
                                        style: const TextStyle(
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                  const Center(
                                      child: CartContainer(
                                    height1: 30,
                                    width1: 140,
                                    borderRadius1: 15,
                                    containerColor1: Colors.white,
                                    textColor1: Colors.green,
                                    height2: 30,
                                    width2: 140,
                                    borderRadius2: 10,
                                    borderWidth1: 1,
                                    borderColor1: Colors.green,
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
    );
  }
}
