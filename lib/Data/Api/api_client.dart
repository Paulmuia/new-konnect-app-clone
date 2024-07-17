import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Colors.green),
        ),
        child: ListView.builder(itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300,
                  width: double.maxFinite,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1, color: Colors.green)),
                      
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
