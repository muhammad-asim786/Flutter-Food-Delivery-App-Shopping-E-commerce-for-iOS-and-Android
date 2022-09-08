// ignore_for_file: prefer_const_constructors

import 'package:delivery_app/Widgets/Big_text.dart';
import 'package:delivery_app/Widgets/small_text.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for picture**********************
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(
                child: Container(
                  height: 250.0,
                  width: 250.0,
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
              height: 10,
            ),
            // for email**********************
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
                      hintStyle:
                          TextStyle(color: Colors.grey[800], fontSize: 25),
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColor.mainColor,
                        size: 40,
                      ),
                      hintText: "Email",
                      fillColor: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
                      hintStyle:
                          TextStyle(color: Colors.grey[800], fontSize: 25),
                      prefixIcon: Icon(
                        Icons.password,
                        color: AppColor.mainColor,
                        size: 40,
                      ),
                      hintText: "Password",
                      fillColor: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // for phone**********************
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
                      hintStyle:
                          TextStyle(color: Colors.grey[800], fontSize: 25),
                      prefixIcon: Icon(
                        Icons.mobile_screen_share,
                        color: AppColor.mainColor,
                        size: 40,
                      ),
                      hintText: "Phone",
                      fillColor: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // for name**********************
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
                      hintStyle:
                          TextStyle(color: Colors.grey[800], fontSize: 25),
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColor.mainColor,
                        size: 40,
                      ),
                      hintText: "Name",
                      fillColor: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30.0,
            ),
            // for signUp container**********************
            Center(
              child: Container(
                height: 100,
                width: 255,
                decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: BigText(
                    text: 'Sign up',
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // for have an account**********************
            Center(
                child: SmallText(
              text: 'Have an account?',
              size: 30,
            )),
            SizedBox(
              height: 30,
            ),
            // for sign up one of the following**********************
            Center(
                child: SmallText(
              text: 'Sign up using one of the following methods',
              size: 25,
              color: Colors.black45,
            )),
            // for Chose one of them google, facebook, twitter**********************
          ],
        ),
      ),
    );
  }
}
