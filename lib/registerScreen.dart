import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenetapp/provider/mainProvider.dart';

import 'constants/constant_colors.dart';
import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Consumer<MainProvider>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image(image: AssetImage("assets/images/join.jpg"))),
                  Center(
                    child: Text(
                      "Join Us!",
                      style: TextStyle(
                        fontFamily: "mukta",
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  cstTextField(
                    controller: value.RegisterNameController,
                    label: "Your Name:",
                    hintText: "Enter your full name",
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                  ),
                  cstTextField1(
                    controller: value.RegisterPhoneController,
                    label: "Your Mobile:",
                    hintText: "Enter your mobile number",
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (value.length != 10) {
                        return 'Mobile number must be 10 digits';
                      }
                      return null;
                    },
                  ),
                  cstTextField(
                    controller: value.RegisterEmailController,
                    label: "Your Email:",
                    hintText: "hello@gmail.com",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  cstTextField(
                    controller: value.RegisterPasswordController,
                    label: "Your Password:",
                    hintText: "Enter your password",
                    icon: Icons.lock,
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: cstBlue,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: height / 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: width / 2.3,
                        color: cstBlue,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: cstBlue,
                          fontWeight: FontWeight.w400,
                          fontFamily: "mukta",
                          fontSize: 10,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: width / 2.3,
                        color: cstBlue,
                      ),
                    ],
                  ),
                  SizedBox(height: height / 50),
                  Center(
                    child: Container(
                      height: height / 20,
                      width: width / 10,
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: cstBlue, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          "G",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "mukta",
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  GestureDetector(
                    onTap: () {
                      if (value.RegisterNameController.text.isNotEmpty &&
                          value.RegisterPhoneController.text.isNotEmpty &&
                          value.RegisterEmailController.text.isNotEmpty &&
                          value.RegisterPasswordController.text.isNotEmpty) {
                        value.addRegistration();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill all fields correctly"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: height / 15,
                      width: width,
                      decoration: BoxDecoration(
                        color: cstBlue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 12,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "mukta",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget cstTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "mukta",
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            fontFamily: "mukta",
            color: cstBlue,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: lightBlue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: cstBlue,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: cstBlue,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: cstBlue,
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: suffixIcon ?? Icon(icon, color: cstBlue),
          ),
        ),
      ],
    );
  }  Widget cstTextField1({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.number,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "mukta",
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: 10,
          validator: validator,
          style: TextStyle(
            fontFamily: "mukta",
            color: cstBlue,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: lightBlue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: cstBlue,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: cstBlue,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: cstBlue,
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: suffixIcon ?? Icon(icon, color: cstBlue),
          ),
        ),
      ],
    );
  }
}