import 'package:flutter/widgets.dart';

class ScreenUtils {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getProportionalWidth(BuildContext context, double width) {
    return screenWidth(context) * width;
  }

  static double getProportionalHeight(BuildContext context, double height) {
    return screenHeight(context) * height;
  }
}
