import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:konnect_app/pages/account_page.dart';
import 'package:konnect_app/pages/cart_page.dart';
import 'package:konnect_app/pages/category_page.dart';
import 'package:konnect_app/pages/chat_page.dart';
import 'package:konnect_app/pages/notification_page.dart';
import 'package:konnect_app/pages/search_page.dart';
import 'package:konnect_app/widgets/auto_scrolling_listview.dart';
import 'package:konnect_app/widgets/category_listview.dart';
import 'package:konnect_app/widgets/new_products.dart';
import 'package:konnect_app/widgets/vertical_foods_listview.dart';
import 'package:konnect_app/widgets/weekly_offers.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    CategoryPage(),
    const ChatPage(),
    const CartPage(),
    const AccountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_rounded,
              color: Colors.blue,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 216, 214, 214),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 55,
                width: double.maxFinite,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                    const Image(
                        width: 150,
                        height: 40,
                        image: AssetImage('assets/images/logo.png')),
                    GestureDetector(
                      onTap: () {
                        Get.to( SearchPage());
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const NotificationPage()),
                      child: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const CartPage()),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 330,
                    width: double.maxFinite,
                    color: Colors.white54,
                  ),

                  //listview for the categories
                  CategoryListView(),

                  //Container for the search text and icon
                  Positioned(
                    top: 80,
                    left: 5,
                    right: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.green, size: 30),
                          SizedBox(width: 20),
                          Text('What are you looking for?',
                              style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                  ),

                  //Container for the auto scrolling list view
                  Positioned(
                    top: 145,
                    left: 5,
                    right: 5,
                    child: AutoScrollingListView(),
                  ),
                ],
              ),
              //Container for the weekly offers text and more text and icon
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.7, color: Colors.grey),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '   Weekly Offers',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Row(
                      children: [
                        Text('more'),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.green, size: 15),
                        SizedBox(width: 15),
                      ],
                    ),
                  ],
                ),
              ),

              //Class containing the weekly offers listview
              WeeklyOffers(),

              //Container for the new products text
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.7, color: Colors.grey),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '   NEW Products',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Row(
                      children: [
                        Text('more'),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.green, size: 15),
                        SizedBox(width: 15),
                      ],
                    ),
                  ],
                ),
              ),

              //Class containing the new products list view
              NewProducts(),

              //Container for the best seller text
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.7, color: Colors.grey),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  BEST SELLER',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),

              //Class containing the all products vertical listview
              Container(color: Colors.white, child: VerticalFoodsListview()),
            ],
          ),
        ),
      ),
    );
  }
}
