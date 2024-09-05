import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants/constant_colors.dart';
import 'getStarted.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder:(context) => GetStarted(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/safenetlogo 1.png",scale: 4,),
            Text("SafeNet",style: TextStyle(color: cstBlue,fontSize: 20,fontFamily: "mukta",fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}