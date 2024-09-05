import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenetapp/provider/mainProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants/constant_colors.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              Center(child: Image.asset("assets/images/login.jpg")),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "mukta",
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildLabel("User Name:"),
              _buildTextField(
                controller: nameController,
                hintText: "Enter your full name",
                icon: Icons.person,
                isObscure: false,
              ),
              SizedBox(height: 15),
              _buildLabel("Your Password:"),
              _buildTextField(
                controller: passwordController,
                hintText: "Enter your password",
                icon: Icons.lock,
                isObscure: obscureText,
                onSuffixIconPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: cstBlue)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(color: cstBlue, fontWeight: FontWeight.w400, fontFamily: "mukta", fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider(color: cstBlue)),
                ],
              ),
              SizedBox(height: height * 0.03),
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: cstBlue, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "G",
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "mukta", fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Consumer<MainProvider>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      final registeredUserName = prefs.getString("REGISTER_NAME");
                      final registeredPassword = prefs.getString("REGISTER_PASSWORD");

                      final inputName = nameController.text.trim();
                      final inputPassword = passwordController.text.trim();

                      if (registeredUserName != null && registeredPassword != null) {
                        if (registeredUserName == inputName && registeredPassword == inputPassword) {
                          Fluttertoast.showToast(
                            msg: "Login Successful!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: cstBlue,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        } else {
                          showSnackBar("Invalid username or password");
                        }
                      } else {
                        showSnackBar("No registered user found");
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
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
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "mukta",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "mukta",
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required bool isObscure,
    VoidCallback? onSuffixIconPressed,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
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
        suffixIcon: isObscure
            ? IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: cstBlue,
          ),
          onPressed: onSuffixIconPressed,
        )
            : Icon(icon, color: cstBlue),
      ),
      keyboardType: TextInputType.text,
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}