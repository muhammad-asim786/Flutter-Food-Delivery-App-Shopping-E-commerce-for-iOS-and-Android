// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery_app/Widgets/Big_text.dart';
import 'package:delivery_app/Widgets/small_text.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../models/popular_products_,odels.dart';
import 'food_body2_page.dart';
ProductsModels productsModels = ProductsModels();

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {

    // print("this is oue name  "+productsModels.name.toString());
    // print('current height is ' + MediaQuery.of(context).size.height.toString());
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'Pakistan',
                          color: AppColor.mainColor,
                          size: 40,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'Pakistan',
                              size: 20,
                              color: Colors.black,
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SingleChildScrollView(child: FoodBody2Page()))
          ],
        ));
  }
}
