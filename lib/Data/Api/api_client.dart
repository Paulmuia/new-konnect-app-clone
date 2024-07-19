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
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      //   title: const Text(
      //     'Home Page',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 25,
      //       fontWeight: FontWeight.w800,
      //     ),
      //   ),
      //   leading: const Padding(
      //     padding: EdgeInsets.only(left: 20),
      //     child: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       radius: 5,
      //       child: Icon(
      //         Icons.person,
      //         size: 20,
      //         color: Colors.green,
      //       ),
      //     ),
      //   ),
      //   actions: const [
      //     Icon(
      //       Icons.search,
      //       color: Colors.white,
      //       size: 30,
      //     ),
      //     SizedBox(
      //       width: 5,
      //     ),
      //     Icon(
      //       Icons.shopping_cart_outlined,
      //       color: Colors.white,
      //       size: 30,
      //     ),
      //     SizedBox(
      //       width: 5,
      //     ),
      //     Icon(Icons.more_vert_outlined, color: Colors.white, size: 30),
      //     SizedBox(
      //       width: 5,
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text('Kenya',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                      Row(
                        children: [
                          Text('Nairobi',style: TextStyle(fontSize: 15),),
                           SizedBox(width: 10,),
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
                      color: Colors.green
                    ),
                    child:const Center(child: Icon(Icons.search,color: Colors.white,),),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              height: 260,
              
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
            ),
            const SizedBox(height: 20,),
            const Text('   Recommended For you',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                return Container(
                  height: 130,
                  margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  width: double.maxFinite,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/food_14.png'),fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 120,
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          color: Colors.white,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  ' Nutritious food meal in kenya',
                                  style: TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10,),
                                 Text(
                                  '  With Kenyan characteristic',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                 SizedBox(
                                  height: 10,
                                ),
                                 Row(
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
