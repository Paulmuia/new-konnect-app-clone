import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollingListView extends StatefulWidget {
  @override
  _AutoScrollingListViewState createState() => _AutoScrollingListViewState();
}

class _AutoScrollingListViewState extends State<AutoScrollingListView> {
  final List<AssetImage> images = [
    const AssetImage('assets/images/slide.jpg'),
    const AssetImage('assets/images/slide1.jpg'),
    const AssetImage('assets/images/slide2.jpg'),
    const AssetImage('assets/images/slide3.jpg'),
  ];

  final PageController _pageController = PageController(viewportFraction: 0.8);
  late Timer _timer;
  int _currentPage = 0;
  bool _isForwardScroll = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_pageController.hasClients) {
        if (_isForwardScroll) {
          if (_currentPage < images.length - 1) {
            _currentPage++;
          } else {
            _isForwardScroll = false;
            _currentPage--;
          }
        } else {
          if (_currentPage > 0) {
            _currentPage--;
          } else {
            _isForwardScroll = true;
            _currentPage++;
          }
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double scale = 1.0;
              if (_pageController.position.haveDimensions) {
                double pageOffset = _pageController.page! - index;
                scale = (1 - (pageOffset.abs() * 0.4)).clamp(0.0, 1.0);
              }
              return Center(
                child: Transform.scale(
                  scale: Curves.easeOut.transform(scale) * 1.20, // Adjust the scaling factor here
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0), // Add margins here
                    child: Container(
                      width: screenWidth - 24, // Max width, accounting for padding
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(image: images[index], fit: BoxFit.cover),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
