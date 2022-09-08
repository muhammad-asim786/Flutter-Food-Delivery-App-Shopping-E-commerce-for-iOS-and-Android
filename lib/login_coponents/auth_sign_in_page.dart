import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthSignInPage extends StatelessWidget {
  const AuthSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // for for image**********************
            Center(
              child: Container(
                height: 350.0,
                width: 530.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/4.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // for Sign in gere! (Container)**********************
            Container(
              height: 200,
            width: 680,
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("Sign in here!",style: const TextStyle(fontSize: 30,color: Colors.white ),),
                  Icon(Icons.send_to_mobile,size: 30,color: Colors.white,)
                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
