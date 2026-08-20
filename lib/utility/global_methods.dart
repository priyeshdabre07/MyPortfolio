import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.widthOf(context);
}

double screenHeight(BuildContext context) {
  return MediaQuery.heightOf(context);
}

double getWHRatio(BuildContext context) {
  return MediaQuery.sizeOf(context).aspectRatio;
}
