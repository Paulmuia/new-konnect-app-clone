import 'package:flutter/material.dart';

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
        title:const  Text('Filtered Foods',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800,fontStyle: FontStyle.italic),),
        leading:const Padding(
          padding: EdgeInsets.only(left: 20),
          child:   CircleAvatar(
            backgroundColor: Colors.white,
            radius: 5,
            child: Icon(Icons.person,size: 20,color: Colors.green,),
          ),
        ),
        actions:const  [
          Icon(Icons.search,color: Colors.white,size: 30,),
          SizedBox(width: 5,),
          Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 30,),
          SizedBox(width: 5,),
          Icon(Icons.more_vert_outlined,color: Colors.white,size:30),
          SizedBox(width: 5,),
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
            itemBuilder: (context,index){
            return Stack(
              children: [
                 Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/slide1.jpg'),
                fit: BoxFit.cover),

                borderRadius:  BorderRadius.all(Radius.circular(10)),
               
              ),
            ),
             Positioned(
              top: 150,
              left: 10,
              right: 10,
               child: Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 1,color: Colors.green),
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