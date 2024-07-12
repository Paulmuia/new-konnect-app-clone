import 'package:flutter/material.dart';
import 'package:konnect_app/widgets/custom_containers.dart';
import 'package:konnect_app/widgets/row_texts.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: double.maxFinite,
              color: Color.fromARGB(255, 219, 242, 247),
              child: SafeArea(
                  child: Column(children: [
                Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  height: 350,
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 216, 214, 214),
                            radius: 70,
                            child: Image(
                              // height: 80,
                              // width: 80,
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              right: 5,
                              bottom: 5,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Good Morning.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Paul Muia',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '+254717285384',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'paul@gmail.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RowTexts(text: '0', text1: 'Total orders'),
                          Text(
                            '|',
                            style: TextStyle(fontSize: 20),
                          ),
                          RowTexts(text: 'Ksh 0', text1: 'Total saved'),
                          Text(
                            '|',
                            style: TextStyle(fontSize: 20),
                          ),
                          RowTexts(text: '0', text1: 'Cart items'),
                          Text(
                            '|',
                            style: TextStyle(fontSize: 20),
                          ),
                          RowTexts(text: '0', text1: 'Vouchers'),
                        ],
                      ),
                    ],
                  ),
                ),
                const CustomContainers(
                    icon: Icon(
                      Icons.notifications_on_outlined,
                      color: Colors.green,
                    ),
                    text: Text(
                      'Notifications',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    icon1: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    )),
                const CustomContainers(
                    icon: Icon(
                      Icons.receipt_long,
                      color: Colors.green,
                    ),
                    text: Text(
                      'My Orders',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    icon1: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    )),
                const CustomContainers(
                    icon: Icon(
                      Icons.card_giftcard,
                      color: Colors.green,
                    ),
                    text: Text(
                      'Vouchers',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    icon1: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    )),
                const CustomContainers(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                    text: Text(
                      'Shipping Adress',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    icon1: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    )),
                const CustomContainers(
                    icon: Icon(
                      Icons.payment,
                      color: Colors.green,
                    ),
                    text: Text(
                      'Payment Method',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    icon1: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    )),
                    const CustomContainers(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.green,
                    ),
                    text: Text(
                      'Settings',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    icon1: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    )),
              ]))),
        ));
  }
}
