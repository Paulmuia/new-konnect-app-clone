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
        centerTitle: true,
        title: const Text(
          'Search Page',
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Colors.green),
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
          return Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.maxFinite,
            //color: Colors.blue,
            child: Stack(
            children: [
              Container(
                height: 180,
                 width: double.maxFinite,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1, color: Colors.green)),
              )
            ],
          ),
          );
        }),
      ),
    );
  }
}
