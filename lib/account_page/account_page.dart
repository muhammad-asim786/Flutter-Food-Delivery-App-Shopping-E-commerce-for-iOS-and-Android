// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        margin: const EdgeInsets.only(top: 50,),
        child: Column(children: [
          Center(child:
            CircleAvatar(
              backgroundColor: AppColor.mainColor,
              radius: 100,child: const Icon(Icons.person,color: Colors.white,size: 110,),),),
          const SizedBox(height: 20,),
          ///  for name Container*********************
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.mainColor,
                        radius: 30,child: const Icon(Icons.person,color: Colors.white,size: 30,),),
                      const SizedBox(width: 30,),
                      const Text('Name',style: const TextStyle(fontSize: 30,),),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ///  for phone Container *********************
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.yellowColor,
                        radius: 30,child: const Icon(Icons.phone,color: Colors.white,size: 30,),),
                      const SizedBox(width: 30,),
                      const Text('Phone',style: const TextStyle(fontSize: 30,),),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ///  for email Container *********************
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.yellowColor,
                        radius: 30,child: const Icon(Icons.person,color: Colors.white,size: 30,),),
                      const SizedBox(width: 30,),
                      const Text('Email',style: TextStyle(fontSize: 30,),),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ///  for location Container *********************
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.yellowColor,
                        radius: 30,child: const Icon(Icons.person,color: Colors.white,size: 30,),),
                      const SizedBox(width: 30,),
                      const Text('Location',style: const TextStyle(fontSize: 30,),),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ///  for massages Container *********************
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 30,child: const Icon(Icons.whatsapp,color: Colors.white,size: 30,),),
                      const SizedBox(width: 30,),
                      const Text('Massage',style: const TextStyle(fontSize: 30,),),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ///  for logout Container *********************
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 30,child: const Icon(Icons.login_rounded,color: Colors.white,size: 30,),),
                      const SizedBox(width: 30,),
                      const Text('LogOut',style: const TextStyle(fontSize: 30,),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],),
      ),
      ///  for BottomNavigationBar Container *********************
      bottomNavigationBar:  Container(
        height: 100,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),
      ),
    );
  }
}
