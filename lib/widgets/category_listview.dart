import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List<AssetImage> images = [
    const AssetImage('assets/images/cup.png'),
    const AssetImage('assets/images/appliances.png'),
    const AssetImage('assets/images/drink.png'),
    const AssetImage('assets/images/personal.png'),
    const AssetImage('assets/images/kids.png'),
    const AssetImage('assets/images/cleaning.png'),
    const AssetImage('assets/images/personal.png'),
    const AssetImage('assets/images/liquor.png'),
    const AssetImage('assets/images/weekly.png'),
    const AssetImage('assets/images/fashion.png'),
    const AssetImage('assets/images/wholesale.png'),
    const AssetImage('assets/images/weekly.png'),
    const AssetImage('assets/images/new.png'),
  ];
  final List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.amber,
    Colors.red,
    Colors.green,
    const Color.fromARGB(255, 7, 247, 227),
    const Color.fromARGB(255, 173, 77, 77),
    const Color.fromARGB(255, 178, 20, 226),
    const Color.fromARGB(255, 248, 212, 4),
    const Color.fromARGB(255, 206, 42, 64),
    const Color.fromARGB(255, 10, 202, 236),
    const Color.fromRGBO(29, 197, 127, 0.541),
  ];

  final List<String> texts = [
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
  CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: colors[index],
                  radius: 20,
                  child: Center(
                      child: Image(
                    image: images[index],
                    fit: BoxFit.contain,
                  )),
                ),
                const SizedBox(height: 8.0),
                Text(
                  texts[index],
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
