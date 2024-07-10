import 'package:flutter/material.dart';

class CartContainer extends StatefulWidget {
  final double height1;
  final double width1;
  final double borderRadius1;
  final Color? borderColor1;
  final double? borderWidth1;
  final Color containerColor1;
  final Color textColor1;
  final double height2;
  final double width2;
  final double borderRadius2;
  final Function(int)? updateItemCount; // Function to update itemCount

  const CartContainer({
    Key? key,
    required this.height1,
    required this.width1,
    required this.borderRadius1,
    this.borderColor1,
    this.borderWidth1,
    required this.containerColor1,
    required this.textColor1,
    required this.height2,
    required this.width2,
    required this.borderRadius2,
    this.updateItemCount, // Receive the function here
  }) : super(key: key);

  @override
  _CartContainerState createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  int itemCount = 0;

  void addItemToCart() {
    setState(() {
      itemCount++;
      if (itemCount == 1) {
        // Show a Snackbar when item count becomes 1
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Center(
              child: Text(
                'One item added to cart successfully',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            backgroundColor: Colors.green, // Set background color to green
            behavior: SnackBarBehavior.floating, // Make it appear slightly below center
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Set curved corners
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 45, vertical: 30), // Adjust position
          ),
        );
      }
    });

    // Call the function to update itemCount in DetailedPage
    widget.updateItemCount!(itemCount);
  }

  void removeItemFromCart() {
    if (itemCount > 0) {
      setState(() {
        itemCount--;
      });

      // Update itemCount in DetailedPage
      widget.updateItemCount!(itemCount);
    }
  }

  void resetCart() {
    setState(() {
      itemCount = 0;
    });

    // Update itemCount in DetailedPage
    widget.updateItemCount!(0);
  }

  @override
  Widget build(BuildContext context) {
    return itemCount == 0
        ? GestureDetector(
            onTap: () {
              addItemToCart();
            },
            child: Container(
              height: widget.height1,
              width: widget.width1,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: widget.containerColor1,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius1),
                ),
                border: Border.all(
                  color: widget.borderColor1 ?? Colors.transparent,
                  width: widget.borderWidth1 ?? 0,
                ),
              ),
              child: Center(
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(color: widget.textColor1, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        : Container(
            height: widget.height2,
            width: widget.width2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius2),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    resetCart();
                  },
                  child: Container(
                    height: 35,
                    width: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.green,
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    removeItemFromCart();
                  },
                  child: Container(
                    height: 35,
                    width: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  '$itemCount',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    addItemToCart();
                  },
                  child: Container(
                    height: 35,
                    width: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.green,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
          );
  }
}
