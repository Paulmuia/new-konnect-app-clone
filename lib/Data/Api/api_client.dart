import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:konnect_app/widgets/icon_texts.dart';

class ApiClient extends StatefulWidget {
  const ApiClient({super.key});

  @override
  State<ApiClient> createState() => _ApiClientState();
}

class _ApiClientState extends State<ApiClient> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 5,
            child: Icon(
              Icons.person,
              size: 20,
              color: Colors.green,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.more_vert_outlined, color: Colors.white, size: 30),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.maxFinite,
            height: 300,
            child: PageView.builder(
                itemCount: 10,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
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
                          image: const DecorationImage(
                              image: AssetImage('assets/images/food_14.png'),
                              fit: BoxFit.cover),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        left: 10,
                        right: 10,
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
                                spreadRadius: 5,
                                blurRadius: 7,
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
                              const Text(
                                '  Vegan Sandwich',
                                style: TextStyle(
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
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
