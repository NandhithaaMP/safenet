import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safenetapp/registerScreen.dart';


import 'constants/constant_colors.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 3,
            ),
            Image.asset("assets/images/getstarted.jpg"),
            Text(
              "Ready to Feast?",
              style: TextStyle(
                color: cstBlue,
                fontSize: 20,
                fontFamily: "mukta",
              ),
            ),
            Text("Let's Begin!",
                style: TextStyle(
                  color: cstBlue,
                  fontSize: 20,
                  fontFamily: "mukta",
                )),
            SizedBox(
              height: height / 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
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
                      ]),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "mukta",
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}