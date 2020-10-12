import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)),
                child: RichText(
                  text: TextSpan(
                      text: 'P',
                      style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      children: [
                        TextSpan(
                            text: 'D',
                            style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ]),
                ),
              ),
              VerticalDivider(),
              Text(
                'Priyesh Dabre',
                style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          FlatButton(onPressed: () {}, child: Text('WORK')),
          FlatButton(onPressed: () {}, child: Text('ABOUT ME')),
          FlatButton(onPressed: () {}, child: Text('CONTACT')),
        ],
      ),
      body: ListView(
        children: [
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
              height: 650,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: [
              "https://assets.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg",
              "https://venturebeat.com/wp-content/uploads/2020/04/flutter-2-million.png?fit=1200%2C600&strip=all",
              "https://dashbouquet.com/static/020b2d58fcc9ac999513a862aa01314c/d47f1/flutter-app-development-post.jpg",
              "https://www.qsstechnosoft.com/wp-content/uploads/2020/08/Flutter-realease.jpg",
              "data:image/png;base64,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",
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Image.network(
                          i,
                          alignment: Alignment.center,
                          height: 50,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          )),
          Text(
            "Skills & Expertise",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                decoration: TextDecoration.underline),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 6,
                  shape: CircleBorder(side: BorderSide.none),
                  child: Image.network(
                    "https://flutterappdev.com/wp-content/uploads/2019/01/Screen-Shot-2019-01-25-at-12.54.42-PM.png",
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 6,
                  shape: CircleBorder(),
                  child: Image.network(
                    "https://dwglogo.com/wp-content/uploads/2018/03/Dart_logo.png",
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 6,
                  shape: CircleBorder(),
                  child: Image.network(
                    "https://dwglogo.com/wp-content/uploads/2019/09/android_logo.png",
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 6,
                  shape: CircleBorder(),
                  child: Image.network(
                    "https://cdn3.iconfinder.com/data/icons/social-media-logos-glyph/2048/5315_-_Apple-512.png",
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
