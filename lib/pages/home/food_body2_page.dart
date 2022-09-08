// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:delivery_app/home/picview_transform.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/controllers/recommended_product_conroller.dart';
import 'package:delivery_app/models/popular_products_,odels.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/app_constant.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/Big_text.dart';
import '../../Widgets/icons_and_texts.dart';
import '../../Widgets/small_text.dart';
import '../../utils/colors.dart';
import '../food/popular_food_detail.dart';

class FoodBody2Page extends StatefulWidget {
  const FoodBody2Page({super.key});

  @override
  State<FoodBody2Page> createState() => _FoodBody2PageState();
}

class _FoodBody2PageState extends State<FoodBody2Page> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageVale = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageVale = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  //scale factor
  double _scaleFactor = .8;
  //view page height
  double _height = 230.0;
  _buildPageItem(int index, ProductsModels popularProduct) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currentPageVale.floor()) {
      var currScale = 1 - (_currentPageVale - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageVale.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageVale - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageVale.floor() - 1) {
      var currScale = 1 - (_currentPageVale - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getPopularFood(index,"home"));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  height: 420,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: const EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:
                          index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/2.jpeg'
                              // AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                              ))),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  width: double.maxFinite,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                        BoxShadow(color: Colors.white, offset: Offset(5, 0))
                      ]),
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: popularProduct.name!,
                          size: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      color: AppColor.mainColor, size: 15)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            BigText(text: "4.5", color: Color(0xFFccc7c5)),
                            SizedBox(
                              width: 10,
                            ),
                            BigText(
                                text: "1287 comments",
                                color: Color(0xFFccc7c5)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            IconsAndText(
                                text: 'text',
                                size: 50,
                                icon: Icons.circle,
                                iconsColor: AppColor.yellowColor),
                            SizedBox(
                              width: 40,
                            ),
                            IconsAndText(
                                text: 'text',
                                size: 50,
                                icon: Icons.location_on,
                                iconsColor: AppColor.mainColor),
                            SizedBox(
                              width: 40,
                            ),
                            IconsAndText(
                                text: 'text',
                                size: 50,
                                icon: Icons.access_time_rounded,
                                iconsColor: AppColor.iconsColor2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // For SliderHorizontal********************
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  // color: Colors.red,
                  height: 530,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (BuildContext context, position) {
                      return _buildPageItem(position,
                          popularProducts.popularProductList[position]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),

        // For dots Indicators********************
        SizedBox(
          height: 20,
        ),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageVale,
            decorator: DotsDecorator(
              activeColor: AppColor.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: 30.0,
        ),

        // for popular Text******************************
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Popular',
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: BigText(
                  text: '.',
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: SmallText(
                  text: 'Food Pairing',
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProducts) {
            return recommendedProducts.isLoaded
                ? ListView.builder(
                    itemCount:
                        recommendedProducts.recommendedProductList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getRecommendedFood(index,"catPage "));
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30, right: 20, bottom: 15, top: 10),
                                height: 250,
                                width: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        // AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProducts.recommendedProductList[index].img!
                                        'assets/1.jpeg'),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.mainColor,
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.only(left: 30),
                                height: 200,
                                width: 400,
                                margin: EdgeInsets.only(left: 280, top: 35),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        text:
                                            // 'Chines Side'
                                            recommendedProducts
                                                .recommendedProductList[index]
                                                .name!,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: List.generate(
                                                5,
                                                (index) => Icon(Icons.star,
                                                    color: AppColor.mainColor,
                                                    size: 15)),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          BigText(
                                              text: "4.5",
                                              color: Color(0xFFccc7c5)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          BigText(
                                              text: "1277 comments",
                                              color: Color(0xFFccc7c5)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: [
                                          IconsAndText(
                                              text: 'text',
                                              size: 50,
                                              icon: Icons.circle,
                                              iconsColor: AppColor.yellowColor),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          IconsAndText(
                                              text: 'text',
                                              size: 50,
                                              icon: Icons.location_on,
                                              iconsColor: AppColor.mainColor),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          IconsAndText(
                                              text: 'text',
                                              size: 50,
                                              icon: Icons.access_time_rounded,
                                              iconsColor: AppColor.iconsColor2),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                : CircularProgressIndicator(
                    color: AppColor.mainColor,
                  );
          },
        ),
      ],
    );
  }
}
