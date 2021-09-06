import 'package:cakes_for_you/screens/components/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///extensions on String
extension StringExtensions on String {
  ///to check if Email is valid.
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidOneDigitNumber {
    final emailRegExp = RegExp(r"\d");
    return emailRegExp.hasMatch(this);
  }

  ///to split string by first.
  String firstSplit(String by) {
    return split(by).first;
  }

  ///to split string by last.
  String lastSplit(String by) {
    return split(by).last;
  }

  ///to get Text widget.
  Text get text {
    return Text(this);
  }

  ///to get date only.
  String get date {
    return substring(0, 10);
  }

  ///to get time only.
  String get time {
    return substring(11, 23);
  }

  String get formattedCurrencyString {
    final amountList = split('.').first.split('');
    int count = 0;
    List formattedString = [];
    String formattedCurrency = '';
    for (int i = amountList.length - 1; i >= 0; i--) {
      formattedString.add(amountList[i]);
      if (count < 2) {
        count++;
      } else {
        formattedString.add(',');

        count = 0;
      }
    }

    for (var i in formattedString.reversed.toList()) {
      formattedCurrency += i;
    }

    formattedCurrency += '.' + split('.').last;
    // print(formattedCurrency);
    return formattedCurrency;
  }

  Widget get background => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(this),
            fit: BoxFit.fitWidth,
          ),
        ),
      );

  ScaffoldFeatureController showSnackBar(context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(60),
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                this,
                size: 16,
                bold: FontWeight.w500,
              ),
            ],
          ),
        ),
      );
}

///extensions on double.
extension DoubleExtensions on double {
  ///to get Widget Padding.
  EdgeInsetsGeometry get padding {
    return EdgeInsets.all(this);
  }

  Widget get heightBox => SizedBox(height: this);

  Widget get widthBox => SizedBox(width: this);

  ///to get CircualarBorderRadius.
  BorderRadiusGeometry get circularBorderRadius {
    return BorderRadius.circular(this);
  }
}

extension WidgetExtensions on Widget {
  Widget get flexible => Flexible(
        child: this,
      );
}

extension DateTimeExtensions on DateTime {
  String get duration {
    if (DateTime.now().difference(this).inSeconds > 60) {
      if (DateTime.now().difference(this).inMinutes > 60) {
        if (DateTime.now().difference(this).inHours > 24) {
          return DateTime.now().difference(this).inDays.toString() +
              ' days ago';
        } else {
          return DateTime.now().difference(this).inHours.toString() +
              ' hours ago';
        }
      } else {
        return DateTime.now().difference(this).inMinutes.toString() +
            ' minutes ago';
      }
    } else {
      return DateTime.now().difference(this).inSeconds.toString() +
          ' seconds ago';
    }
  }

  DateTime get date {
    return DateTime(year, month, day);
  }
}
