import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:konnect_app/pages/Authentication/verification_page.dart';
import 'package:konnect_app/pages/home_page.dart';
import 'package:konnect_app/widgets/test.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;


String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    final phoneNumber = value.replaceFirst('+254', ''); // Assuming country code is +254
    if (phoneNumber.length != 9 || !RegExp(r'^\d+$').hasMatch(phoneNumber)) {
      return 'Invalid phone number. Must be 9 digits.';
    }
    return null; // Valid
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

void _login() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      isLoading = true;
    });

    String phoneNumber = '+254${phoneController.text}';
    print('Logging in with phone number: $phoneNumber');

    try {
      // Check if user exists in Firestore
      bool userExists = await _checkIfUserExists(phoneNumber);

      if (userExists) {
        // User exists, initiate phone number verification
        _verifyPhoneNumber(phoneNumber);
      } else {
        setState(() {
          isLoading = false;
        });
        _showSnackbar('User does not exist. Please sign up.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error checking user existence: $e");
      _showSnackbar('Error checking user existence. Please try again.');
    }
  }
}

Future<bool> _checkIfUserExists(String phoneNumber) async {
  try {
    // Query Firestore for users with the given phone number
    QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    return result.docs.isNotEmpty;
  } catch (e) {
    print("Error checking user existence: $e");
    return false;
  }
}

void _verifyPhoneNumber(String phoneNumber) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
      Get.offAll(() => HomePage()); // Navigate to home page
    },
    verificationFailed: (FirebaseAuthException e) {
      setState(() {
        isLoading = false;
      });
      print("Verification failed: ${e.message}");
      _showSnackbar('Verification failed. Please try again.');
    },
    codeSent: (String verificationId, int? resendToken) {
      Get.offAll(() => VerificationPage(
        verificationId: verificationId,
        firstName: '',
        lastName: '',
        selectedAge: '',
        selectedHousehold: '',
        whatsappNumber: '',
        selectedSex: '',
      ));
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}




  Future<bool> _checkUserExists(String phoneNumber) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking user existence: $e");
      return false;
    }
  }

  Future<void> _sendOTP(String phoneNumber) async {
    // Start phone number verification
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieve verification code (e.g., on Android)
        // signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          isLoading = false;
        });
        print("Verification failed: ${e.message}");
        // Handle verification failure, e.g., show error dialog
      },
      codeSent: (String verificationId, int? resendToken) {
        // Navigate to verification page and pass verificationId
        Get.offAll(() => VerificationPage(
              verificationId: verificationId,
              firstName: '', // Pass appropriate values or empty strings
              lastName: '', // Pass appropriate values or empty strings
              selectedAge: '', // Pass appropriate values or empty strings
              selectedHousehold: '', // Pass appropriate values or empty strings
              whatsappNumber: '', // Pass appropriate values or empty strings
              selectedSex: '', // Pass appropriate values or empty strings
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
        backgroundColor: Colors.red,
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
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Center(
                        child: Image(
                          height: 30,
                          width: 200,
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'Log in to your account',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '    Mobile Number',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
PhoneNumberInput(controller: phoneController, labelText: "Phone number", validator: validatePhone),
                      
                      const SizedBox(height: 10),
                      Center(
                        child: GestureDetector(
                          onTap: _login,
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
                                      'Send Code',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Don't have an account",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(const SignUp());
                                  },
                                text: '    Sign Up',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
