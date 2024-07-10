import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../pages/home_page.dart';

class VerificationPage extends StatefulWidget {
  final String verificationId;
  final String firstName;
  final String lastName;
  final String selectedAge;
  final String selectedHousehold;
  final String whatsappNumber; // Add this
  final String selectedSex; // Add this

  const VerificationPage({
    Key? key,
    required this.verificationId,
    required this.firstName,
    required this.lastName,
    required this.selectedAge,
    required this.selectedHousehold,
    required this.whatsappNumber, // Add this
    required this.selectedSex, // Add this,
  }) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  int _start = 90;
  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  final TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isInvalidCode = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _verifyCode() async {
  setState(() {
    isLoading = true;
    isInvalidCode = false;
  });

  // Validate OTP field
  if (pinController.text.trim().isEmpty) {
    setState(() {
      isLoading = false;
      isInvalidCode = true;
    });
    _showSnackbar('Please enter OTP');
    return;
  }

  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: pinController.text.trim(),
    );

    // Sign in with credential
    await auth.signInWithCredential(credential);

    // Check if user already exists in Firestore
    bool userExists = await _checkUserExists(auth.currentUser!.phoneNumber!);

    if (userExists) {
      // User already exists, show Snackbar
      _showSnackbar('User already exists');
    } else {
      // Save user details to Firestore
      await _saveUserDetails();

      // Show success Snackbar
      _showSnackbar('Registration successful');

      // Navigate to home page on successful verification and data saving
      Get.offAll(() => HomePage());
    }
  } catch (e) {
    setState(() {
      isLoading = false;
      isInvalidCode = true;
    });

    print("Error verifying code: $e");
    // Handle error, e.g., show error dialog
  }
}


  Future<bool> _checkUserExists(String phoneNumber) async {
    try {
      // Query Firestore for users with the given phone number
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      // If any documents are returned, user exists
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking user existence: $e");
      return false;
    }
  }

  Future<void> _saveUserDetails() async {
    try {
      // Get current user
      User? user = auth.currentUser;

      // Create a new document for the user with UID
      await firestore.collection('users').doc(user!.uid).set({
        'firstName': widget.firstName,
        'lastName': widget.lastName,
        'age': widget.selectedAge,
        'householdSize': widget.selectedHousehold,
        'phoneNumber': user.phoneNumber, // Save phone number for future reference
        'whatsappNumber': widget.whatsappNumber, // Save WhatsApp number
        'sex': widget.selectedSex, // Save sex
        // Add other fields as needed
      });
    } catch (e) {
      print("Error saving user details: $e");
      // Handle error, e.g., show error dialog
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor:
            message.contains('successful') ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromARGB(255, 2, 245, 10);
    const fillColor = Color.fromRGBO(241, 241, 241, 1);
    const borderColor = Color.fromARGB(255, 2, 245, 10);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      textStyle: const TextStyle(color: Colors.white),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red),
        color: const Color.fromARGB(255, 218, 97, 89),
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 350,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  const Image(
                    height: 30,
                    width: 200,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Verify Phone Number',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 99, 160, 103),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Otp has been successfully sent. Your OTP will expire in",
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            TextSpan(
                              text: '     $timerText',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Pinput(
                    length: 6,
                    controller: pinController,
                    focusNode: focusNode,
                    defaultPinTheme: isInvalidCode ? errorPinTheme : defaultPinTheme,
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    onCompleted: (pin) {
                      _verifyCode();
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: isInvalidCode
                        ? errorPinTheme
                        : defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                    submittedPinTheme: isInvalidCode
                        ? errorPinTheme
                        : defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                  ),
                  if (isInvalidCode)
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Invalid OTP. Please try again.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 247, 19, 2),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: isLoading ? null : _verifyCode,
                    child: Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Verify',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
