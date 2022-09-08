// ignore_for_file: prefer_const_constructors

import 'package:delivery_app/Widgets/Big_text.dart';
import 'package:delivery_app/Widgets/small_text.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              // for picture**********************
              child: Center(
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/3.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            // for Hello**********************
            Text(
              'Hello',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            // for sign into your account**********************
            SmallText(
              text: 'Sign into your account',
              size: 30,
            ),
            SizedBox(
              height: 40,
            ),
            // for Phone**********************
            Container(
              padding: EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 25,
                    offset: Offset(4, 10), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 25),
                      prefixIcon: Icon(Icons.mobile_screen_share,color: AppColor.mainColor,size: 40,),
                      hintText: "Phone",
                      fillColor: Colors.white70),
                ),
              ),
            ),
            SizedBox(height: 30,),
            // for password**********************
            Container(
              padding: EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 25,
                    offset: Offset(4, 10), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 25),
                      prefixIcon: Icon(Icons.password,color: AppColor.mainColor,size: 40,),
                      hintText: "Password",
                      fillColor: Colors.white70),
                ),
              ),
            ),
            SizedBox(height: 30,),
            // for sign into your account**********************
            Container(
                margin: EdgeInsets.only(left: 350),
                child: SmallText(text: 'sign into your account',size: 30,)),
            SizedBox(height: 100,),
            // for Sign in container**********************
            Center(
              child: Container(
                height: 90,
                width: 255,
               decoration: BoxDecoration(
                 color: AppColor.mainColor,
                 borderRadius: BorderRadius.circular(40),
               ),
                child: Center(child: BigText(text: 'Sign in',color: Colors.white,size: 40,),),
              ),
            ),
            SizedBox(height: 70,),
            // for Don't have an account**********************
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(text: 'Don\'t have an account?',size: 30,),
                SizedBox(width: 9,),
                Text('Create',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
