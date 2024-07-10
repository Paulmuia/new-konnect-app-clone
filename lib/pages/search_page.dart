import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konnect_app/pages/detailed_page.dart';
import 'package:konnect_app/widgets/cart_container.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<AssetImage> images = [
    const AssetImage('assets/images/milk.jpeg'),
    const AssetImage('assets/images/indomie.jpeg'),
    const AssetImage('assets/images/halisi.jpg'),
    const AssetImage('assets/images/ketepa.jpeg'),
    const AssetImage('assets/images/sunlight.jpeg'),
    const AssetImage('assets/images/riri.jpeg'),
    const AssetImage('assets/images/ajabugali.jpeg'),
    const AssetImage('assets/images/minute.jpeg'),
    const AssetImage('assets/images/ajabmaize.jpeg'),
    const AssetImage('assets/images/nescafe.jpeg'),
    const AssetImage('assets/images/kabras.jpeg'),
    const AssetImage('assets/images/indomie.jpeg'),
    const AssetImage('assets/images/sortcare.jpeg'),
  ];
  final List<int> prices = [
    150, // Price for cup
    299, // Price for appliances
    120, // Price for drink
    175, // Price for personal item
    250, // Price for kids item
    300, // Price for cleaning item
    160, // Another personal item
    210, // Price for liquor
    185, // Price for weekly item
    230, // Price for fashion item
    176, // Price for wholesale item
    230, // Another weekly item
    200, // Price for new item
  ];
  final List<int> markedPrice = [
    180, // Price for cup
    350, // Price for appliances
    170, // Price for drink
    220, // Price for personal item
    290, // Price for kids item
    350, // Price for cleaning item
    220, // Another personal item
    250, // Price for liquor
    240, // Price for weekly item
    280, // Price for fashion item
    250, // Price for wholesale item
    300, // Another weekly item
    280, // Price for new item
  ];
  final List<int> offers = [
    30, // Price for cup
    50, // Price for appliances
    24, // Price for drink
    32, // Price for personal item
    20, // Price for kids item
    27, // Price for cleaning item
    36, // Another personal item
    18, // Price for liquor
    35, // Price for weekly item
    10, // Price for fashion item
    40, // Price for wholesale item
    28, // Another weekly item
    16, // Price for new item
  ];

  final List<String> texts = [
    'Mount Kenya UHT Milk',
    'Indomie Instant Noodles',
    'Halisi Vegetable Cooking Oil',
    'Ketepa Fahari ya Kenya Tea',
    'Sunlight Washing Powder 1kg',
    'Riri Maize Flour 2kg',
    'Ajab Maize Flour 2kg',
    'Minute Maid Juice 1L',
    'Ajab Wheat Flour 2kg',
    'Nescafe Classic Coffee',
    'Kabras Premium White Sugar 1kg',
    'Indomie Instant Noodles',
    'Softcare Baby Pampers',
  ];

  List<int> filteredIndexes = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredIndexes = List.generate(images.length, (index) => index);
  }

  void _filterSearchResults(String query) {
    List<int> tempIndexes = [];
    if (query.isNotEmpty) {
      for (int i = 0; i < texts.length; i++) {
        if (texts[i].toLowerCase().contains(query.toLowerCase())) {
          tempIndexes.add(i);
        }
      }
    } else {
      tempIndexes = List.generate(images.length, (index) => index);
    }
    setState(() {
      filteredIndexes = tempIndexes;
    });
  }

  void _clearSearch() {
    searchController.clear();
    _filterSearchResults('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
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
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey[300],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (value) => _filterSearchResults(value),
                          decoration: InputDecoration(
                            hintText: 'What are you looking for?',
                            prefixIcon: const Icon(Icons.search),
                            filled: true, 
                            fillColor: Colors.grey[200],
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _clearSearch,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey[200],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.clear_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: filteredIndexes.isNotEmpty
                    ? ListView.builder(
                        itemCount: filteredIndexes.length,
                        itemBuilder: (context, index) {
                          int i = filteredIndexes[index];
                          return GestureDetector(
                            onTap: ()=>Get.to(const DetailedPage(),
                                   arguments: {
                  'image': images[i],
                  'price': prices[i].toString(),
                  'offer': offers[i].toString(),
                  'text': texts[i],
                  'markedPrice': markedPrice[i].toString(),
                },
                            
                            ),
                            child: Container(
                              height: 150,
                              width: double.maxFinite,
                              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(width: 1, color: Colors.green),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        image: images[i],
                                        fit: BoxFit.fill,
                                      ),
                                      border: Border.all(width: 0.4, color: Colors.green),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10, top: 10),
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                                        border: Border.all(width: 0.4, color: Colors.green),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            texts[i],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ksh ${prices[i]}',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Text(
                                                'Ksh ${markedPrice[i]}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Center(
                                            child: CartContainer(
                                              height1: 40,
                                              width1: 140,
                                              borderRadius1: 15,
                                              containerColor1: Colors.green,
                                              textColor1: Colors.white,
                                              height2: 30,
                                              width2: 140,
                                              borderRadius2: 10,
                                              borderWidth1: 1,
                                              borderColor1: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          'No item found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
