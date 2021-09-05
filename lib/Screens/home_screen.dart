import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_app/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
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
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)),
                child: RichText(
                  text: TextSpan(
                      text: 'P',
                      style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold, color: Colors.pink),
                      children: [
                        TextSpan(
                            text: 'D',
                            style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ]),
                ),
              ),
              const VerticalDivider(),
              Text(
                'Cakes For You',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: () {}, child: const Text('WORK')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: () {}, child: const Text('ABOUT ME')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: () {}, child: const Text('CONTACT')),
          ),
        ],
      ),
      body: CupertinoScrollbar(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              // height: 300,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5, crossAxisCount: 4),
                itemBuilder: (context, index) => const CakeCard(),
              ),
            ),
            const Text(
              "Bestsellers",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}

class CakeCard extends StatefulWidget {
  const CakeCard({Key? key}) : super(key: key);

  @override
  _CakeCardState createState() => _CakeCardState();
}

class _CakeCardState extends State<CakeCard> {
  double elevation = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(cakeDetailsRoute, arguments: '');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            elevation = 8;
          });
        },
        onExit: (event) {
          setState(() {
            elevation = 1;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Card(
              elevation: elevation,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Hero(
                tag: 'cake',
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoZU6Iqqqcsoo0J7Zpw-kjL6UtVKpNJKpTiA&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
