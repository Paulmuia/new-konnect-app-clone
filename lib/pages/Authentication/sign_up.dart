import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:konnect_app/pages/Authentication/login.dart';
import 'package:konnect_app/pages/Authentication/verification_page.dart';
import 'package:konnect_app/widgets/test.dart';
import '../../widgets/drop_down_textFields.dart';
import '../../widgets/text_form_fields.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  bool isLoading = false;
  String? selectedSex;
  String? selectedAge;
  String? selectedHousehold;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        bool userExists = await _checkIfUserExists();
        if (userExists) {
          setState(() {
            isLoading = false;
          });
          _showSnackbar('User already exists with this phone number');
        } else {
          await _verifyPhoneNumber();
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print("Error: $e");
        // Handle error, e.g., show error dialog
      }
    }
  }

  Future<bool> _checkIfUserExists() async {
    String phoneNumber = phoneController.text;
    QuerySnapshot result = await firestore
        .collection('users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    return result.docs.isNotEmpty;
  }

  Future<void> _verifyPhoneNumber() async {
    // Start phone number verification
    String phoneNumber =
        '+254${phoneController.text}'; // Adjust country code as needed
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
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              selectedAge: selectedAge ??
                  '', // Ensure a default value if selectedAge is nullable
              selectedHousehold: selectedHousehold ??
                  '', // Ensure a default value if selectedHousehold is nullable
              whatsappNumber: whatsappController.text, // Pass WhatsApp number
              selectedSex: selectedSex ?? '', // Pass sex
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
        backgroundColor:
            Colors.red, // Set background color to red for error message
        behavior:
            SnackBarBehavior.floating, // Make it appear slightly below center
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Set curved corners
        ),
        margin: const EdgeInsets.symmetric(
            horizontal: 45, vertical: 30), // Adjust position
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
              height: 500,
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
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFields(
                              controller: firstNameController,
                              labelText: 'First Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormFields(
                              controller: lastNameController,
                              labelText: 'Last Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '    Mobile Number',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                        Expanded(
                            child: PhoneNumberInput(controller: phoneController, labelText: "Phone number", validator: validatePhone)
                          ),
                          Expanded(
                            child: DropdownButtonFormFieldWithMargin(
                              value: selectedSex,
                              labelText: 'Sex',
                              items: const ['Male', 'Female', 'Rather not say'],
                              onChanged: (value) {
                                setState(() {
                                  selectedSex = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select your sex';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                              '  Phone number above is not whatsapp number?'),
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                      if (isChecked)
                        Column(
                          children: [
                            TextFormFields(
                              controller: whatsappController,
                              labelText: 'Whatsapp Number',
                              validator: (value) {
                                if (isChecked &&
                                    (value == null || value.isEmpty)) {
                                  return 'Please enter your WhatsApp number';
                                }
                                // if (isChecked &&
                                //     !RegExp(r'^\d{10}$').hasMatch(value!)) {
                                //   return 'Please enter a valid 10-digit WhatsApp number';
                                // }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormFieldWithMargin(
                              value: selectedAge,
                              labelText: 'Age',
                              items: const [
                                '18-24',
                                '25-35',
                                '36-50',
                                'Above 60'
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedAge = value as String?;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select your age group';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormFieldWithMargin(
                              value: selectedHousehold,
                              labelText: 'Household Size',
                              items: const ['1', '2', '3', '4', '5', 'Above 5'],
                              onChanged: (value) {
                                setState(() {
                                  selectedHousehold = value as String?;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select your household size';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: _signUp,
                        child: Center(
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
                                      'Sign Up',
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
                      const SizedBox(height: 15),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Have an account",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(const Login());
                                  },
                                text: '    Login',
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
