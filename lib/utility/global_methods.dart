import 'package:flutter/material.dart';

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWHRatio(context) {
  return MediaQuery.of(context).size.aspectRatio;
}
