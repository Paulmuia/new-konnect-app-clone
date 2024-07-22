import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konnect_app/Data/Api/food_page.dart';
import 'package:konnect_app/widgets/icon_texts.dart';

class ApiClient extends StatefulWidget {
  const ApiClient({super.key});

  @override
  State<ApiClient> createState() => _ApiClientState();
}

class _ApiClientState extends State<ApiClient> {

  final List<String> texts = [
    'Greek salad',
    'Veg salad',
    'Clover Salad',
    'Chicken Salad',
    'Lasagna Rolls',
    'Peri Peri Rolls',
    'Chicken Rolls',
    'Veg Rolls',
    'Ripple Ice Cream',
    'Fruit Ice Cream',
    'Jar Ice Cream',
    'Vanilla Ice Cream',
    'Chicken Sandwich',
    'Vegan Sandwich',
    'Grilled Sandwich',
    'Bread Sandwich',
    'Cup Cake',
    'Vegan Cake',
    'Butterscotch Cake',
    'Sliced Cake',
    'Garlic Mushroom',
    'Fried Cauliflower',
    'Mix Veg Pulao',
    'Rice Zucchini',
    'Cheese Pasta',
    'Tomato Pasta',
    'Creamy Pasta',
    'Chicken Pasta',
    'Butter Noodles',
    'Veg Noodles',
    'Somen Noodles',
    'Cooked Noodles',
];
final List<AssetImage> images = [
  const AssetImage('assets/testing/food_1.png'),
  const AssetImage('assets/testing/food_2.png'),
  const AssetImage('assets/testing/food_3.png'),
  const AssetImage('assets/testing/food_4.png'),
  const AssetImage('assets/testing/food_5.png'),
  const AssetImage('assets/testing/food_6.png'),
  const AssetImage('assets/testing/food_7.png'),
  const AssetImage('assets/testing/food_8.png'),
  const AssetImage('assets/testing/food_9.png'),
  const AssetImage('assets/testing/food_10.png'),
  const AssetImage('assets/testing/food_11.png'),
  const AssetImage('assets/testing/food_12.png'),
  const AssetImage('assets/testing/food_13.png'),
  const AssetImage('assets/testing/food_14.png'),
  const AssetImage('assets/testing/food_15.png'),
  const AssetImage('assets/testing/food_16.png'),
  const AssetImage('assets/testing/food_17.png'),
  const AssetImage('assets/testing/food_18.png'),
  const AssetImage('assets/testing/food_19.png'),
  const AssetImage('assets/testing/food_20.png'),
  const AssetImage('assets/testing/food_21.png'),
  const AssetImage('assets/testing/food_22.png'),
  const AssetImage('assets/testing/food_23.png'),
  const AssetImage('assets/testing/food_24.png'),
  const AssetImage('assets/testing/food_25.png'),
  const AssetImage('assets/testing/food_26.png'),
  const AssetImage('assets/testing/food_27.png'),
  const AssetImage('assets/testing/food_28.png'),
  const AssetImage('assets/testing/food_29.png'),
  const AssetImage('assets/testing/food_30.png'),
  const AssetImage('assets/testing/food_31.png'),
];
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
    centerTitle:true,
    title:const Text('Api client',style:TextStyle(color:Colors.blue),
    ),),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Kenya',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            'Nairobi',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.green),
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              color: Colors.white,
              width: double.maxFinite,
              height: 260,
              child: PageView.builder(
                  itemCount: images.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(FoodPage()),
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              image:  DecorationImage(
                                  image: images[index],
                                  fit: BoxFit.cover),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          left: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () => Get.to(FoodPage()),
                            child: Container(
                              height: 110,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                //border: Border.all(width: 1,color: Colors.green),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    "   ${texts[index]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      AnimatedRatingStars(
                                        initialRating: 3.5,
                                        minRating: 0.0,
                                        maxRating: 5.0,
                                        filledColor: Colors.blue,
                                        emptyColor: Colors.grey,
                                        filledIcon: Icons.star,
                                        halfFilledIcon: Icons.star_half,
                                        emptyIcon: Icons.star_border,
                                        onChanged: (double rating) {},
                                        displayRatingValue: true,
                                        interactiveTooltips: true,
                                        customFilledIcon: Icons.star,
                                        customHalfFilledIcon: Icons.star_half,
                                        customEmptyIcon: Icons.star_border,
                                        starSize: 15,
                                        animationDuration:
                                            const Duration(milliseconds: 300),
                                        animationCurve: Curves.easeInOut,
                                        readOnly: false,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        '1200 comments',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconText(
                                          icon: Icons.circle,
                                          color: Colors.amber,
                                          size: 20,
                                          text: 'Normal'),
                                      IconText(
                                          icon: Icons.location_on,
                                          color: Colors.blueGrey,
                                          size: 20,
                                          text: '32 KM'),
                                      IconText(
                                          icon: Icons.timer,
                                          color: Colors.green,
                                          size: 20,
                                          text: '45 min')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: DotsIndicator(
                    decorator: const DotsDecorator(
                      activeColor: Colors.amber,
                      color: Colors.grey,
                      activeSize: Size(15, 15),
                      size: Size(10, 10),
                    ),
                    dotsCount: 7)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '   Recommended For you',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: images.length,
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            height: 120,
                            width: 120,
                            decoration:  BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        images[index],
                                    fit: BoxFit.cover),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Colors.white),
                          ),
                          Expanded(
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              color: Colors.white,
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    texts[index],
                                    style:const  TextStyle(
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '  With Kenyan characteristic',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                  
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconText(
                                          icon: Icons.circle,
                                          color: Colors.amber,
                                          size: 20,
                                          text: 'Normal'),
                                      IconText(
                                          icon: Icons.location_on,
                                          color: Colors.blueGrey,
                                          size: 20,
                                          text: '32 KM'),
                                      IconText(
                                          icon: Icons.timer,
                                          color: Colors.green,
                                          size: 20,
                                          text: '45 min')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
