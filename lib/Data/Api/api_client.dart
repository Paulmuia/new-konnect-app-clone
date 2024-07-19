import 'package:flutter/material.dart';

class ApiClient extends StatefulWidget {
  const ApiClient({super.key});

  @override
  State<ApiClient> createState() => _ApiClientState();
}

class _ApiClientState extends State<ApiClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:const  Text('Filtered Foods',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800,fontStyle: FontStyle.italic),),
        leading:const  CircleAvatar(
          backgroundColor: Colors.white,
          radius: 10,
          child: Icon(Icons.person,size: 30,color: Colors.green,),
        ),
        actions:const  [
          Icon(Icons.search,color: Colors.white,size: 20,),
          SizedBox(width: 10,),
          Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 20,),
          SizedBox(width: 10,),
          Icon(Icons.notifications_active,color: Colors.white,size: 20,),
          SizedBox(width: 10,),
          Icon(Icons.more_vert_outlined,color: Colors.white,size:20),
          SizedBox(width: 10,),
          


        ],
      ),
    );
  }
}