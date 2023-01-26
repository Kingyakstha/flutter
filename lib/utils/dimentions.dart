import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  //932/220 4.23;
  static double pageViewContainer = screenHeight / 4.23;
  static double pageViewTextContainer = screenHeight / 7.76;
  static double pageView = screenHeight / 2.91;

  //932
  static double height10 = screenHeight / 93.2;
  static double height20 = height10 * 2;
  static double height5 = height10 / 2;
  static double height45 = height5 * 9;
  static double height30 = height10 * 3;
  static double height120 = height10 * 12;
  static double height110 = height10 * 11;

  //430
  static double width10 = screenWidth / 43;
  static double width20 = width10 * 2;
  static double width5 = width10 / 2;
  static double width45 = width5 * 9;
  static double width30 = width10 * 3;
  static double width120 = width10 * 12;

  //list view size
}
