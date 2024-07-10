

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:konnect_app/pages/detailed_page.dart';
import 'package:konnect_app/widgets/cart_container.dart';

class WeeklyOffers extends StatelessWidget {
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
  WeeklyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 255,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 235,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.green),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.green),
                      child: Center(
                          child: Text(
                        '-Ksh ${offers[index].toString()}',
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                    Positioned(
                      top: 35,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => Get.to( const DetailedPage(),
                            arguments: {
                  'image': images[index],
                  'price': prices[index].toString(),
                  'offer': offers[index].toString(),
                  'text': texts[index],
                  'markedPrice': markedPrice[index].toString(),
                },
                        ),
                        child: Container(
                            height: 120,
                            width: 140,
                            color: Colors.white,
                            child: Image(
                              image: images[index],
                              fit: BoxFit.contain,
                            )),
                      ),
                    ),
                    Positioned(
                      top: 160,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        height: 100,
                        width: 140,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(texts[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis),
                            Text(
                              'Ksh ${prices[index].toString()}', // Converts the price to a string with 2 decimal places
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Center(
                              child:CartContainer(
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
                                )
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
