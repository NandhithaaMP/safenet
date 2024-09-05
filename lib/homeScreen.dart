import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/constant_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height/2.2,
            width: width,
            decoration: BoxDecoration(
                color: cstBlue
            ),
            child: Row(
              children: [
                Image.asset("assets/images/women.png",scale: 3,),
                Center(child: Text("  Avoid the \n   scare of \ncorona virus",style: TextStyle(fontSize: 28,fontFamily: "mukta",fontWeight: FontWeight.bold),)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Symptoms",style: TextStyle(fontFamily: "mukta",fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: height/6,
                        width: width/2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(0, 4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),


                          ],


                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/cold.png",scale: 7,),
                            Center(child: Text("Cold",style: TextStyle(fontFamily: "mukta",fontSize: 15,fontWeight: FontWeight.w500),)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      height: height/6,
                      width: width/2.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),

                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            Center(child: Text("Cough",style: TextStyle(fontFamily: "mukta",fontSize: 15,fontWeight: FontWeight.w500),)),
                            SizedBox(width: 10,),
                            Image.asset("assets/images/cough.png",scale: 13,)
                          ],
                        ),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Emergency Guide",style: TextStyle(fontFamily: "mukta",fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  height: height/5,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),

                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Avoid the scare of \n    corona virus",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "mukta",fontSize: 15),),
                            SizedBox(height: 10,),
                            Container(
                              height: height/15,
                              width: width/3,
                              decoration: BoxDecoration(
                                  color: cstBlue,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text("Call",style: TextStyle(fontFamily: "mukta",fontWeight: FontWeight.bold),)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Image.asset("assets/images/corona.png",scale: 5,)
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

}