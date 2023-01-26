import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/app_column.dart';
import 'package:flutter_projects/widgets/big_text.dart';
import 'package:flutter_projects/widgets/icon_text_widget.dart';
import 'package:flutter_projects/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        //color: Colors.redAccent,
        height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      SizedBox(
        height: Dimensions.height30,
      ),
      Container(
        // decoration: BoxDecoration(color: Colors.red),
        margin: EdgeInsets.only(
            left: Dimensions.width10), //(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(text: "Popular"),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".")),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing")),
          ],
        ),
      ),
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                //decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(bottom: Dimensions.height10),
                      height: Dimensions.height120,
                      width: Dimensions.width120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white38,
                          image: DecorationImage(
                              image: AssetImage("assets/images/meat.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.height110,
                        //width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10,
                              top: Dimensions.height10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "Nutricious stake"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(text: "With American characteristic"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1),
                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.7m",
                                      iconColor: AppColors.mainColor),
                                  IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: AppColors.iconColor2),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          })
    ]);
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            image: const DecorationImage(
                image: AssetImage("assets/images/meat.jpg"), fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            //width: 350,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0, //smaller the number darker the blur
                      offset: Offset(0, 5)),
                  BoxShadow(
                      color: Colors.white, //smaller the number darker the blur
                      offset: Offset(-5, 0)),
                  BoxShadow(
                      color: Colors.white, //smaller the number darker the blur
                      offset: Offset(5, 0)),
                ]),
            child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: const AppColumn()),
          ),
        )
      ]),
    );
  }
}
