// ignore_for_file: prefer_const_constructors

import 'package:delivery_app/models/popular_products_,odels.dart';
import 'package:delivery_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Widgets/Big_text.dart';
import '../../Widgets/icons_and_texts.dart';
import '../../controllers/popular_product_cotroller.dart';
import '../../utils/colors.dart';
import 'package:http/http.dart' as http;


// late final String nameResponce;

class PicView extends StatelessWidget {
  const PicView(BuildContext context, ProductsModels popularProduct, {Key? key}) : super(key: key);


  final int index = 1;

  @override
  Widget build(BuildContext context) {
    // print(poularProduct.name);
    return Stack(
      children: [
           GestureDetector(
            onTap: (){
              // print(productsModels.name);
            },
            child: Container(
              // padding: EdgeInsets.only(bottom: 120),
              margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
              height: 450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage( ''
    // "${AppConstants.BASE_URL}/uploads/${popularProducts.img!}"
    ),

                    // NetworkImage("${AppConstants.BASE_URL}/uploads/${productsModels.img}",
                    //   scale: 1.0,
                    // ),
                  ),
                  color: index.isOdd ? Color(0xFF79c5df) : Color(0xFF9294cc),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 80, right: 80, top: 10),
            height: 190,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 GetBuilder<PopularProductController>(builder: (productModels){
                   return  BigText(
                     text: 'Chinees Side',
                     // productsModels.name.toString(),
                     size: 36,
                     color: Colors.black,
                   );
                 }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColor.mainColor,
                                    size: 30,
                                  ))),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '4.2',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '1288',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Commentes',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconsAndText(
                          text: 'Normal',
                          size: 50,
                          icon: Icons.circle,
                          iconsColor: Colors.yellow),
                      SizedBox(
                        width: 40,
                      ),
                      IconsAndText(
                          text: '1.7Km',
                          size: 50,
                          icon: Icons.location_on,
                          iconsColor: AppColor.mainColor),
                      SizedBox(
                        width: 40,
                      ),
                      IconsAndText(
                          text: '23min',
                          size: 50,
                          icon: Icons.access_time_rounded,
                          iconsColor: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
