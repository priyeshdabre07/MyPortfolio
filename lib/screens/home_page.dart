import 'dart:ui';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cakes_for_you/screens/components/drawer.dart';
import 'package:cakes_for_you/utility/global_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:cakes_for_you/utility/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cakes_for_you/utility/router.gr.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: screenWidth(context) > 400 ? null : const CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: IntrinsicHeight(
          child: Row(
            children: [
              if (screenWidth(context) > 400)
                SizedBox(
                  width: screenWidth(context) * 0.15,
                ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown),
                    borderRadius: BorderRadius.circular(15)),
                child: RichText(
                  text: TextSpan(
                    text: 'Cakes For You',
                    style: GoogleFonts.radley(
                        fontWeight: FontWeight.bold, color: Colors.pink),
                    // children: [
                    // TextSpan(
                    //     text: 'D',
                    //     style: GoogleFonts.robotoCondensed(
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black))
                    // ]
                  ),
                ),
              ),
              // const VerticalDivider(),
              // Text(
              //   'Cakes For You',
              //   style: GoogleFonts.openSans(
              //       fontWeight: FontWeight.bold,
              //       color: Theme.of(context).accentColor),
              // ),
            ],
          ),
        ),
        actions: screenWidth(context) > 400
            ? [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      TextButton(onPressed: () {}, child: const Text('WORK')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {}, child: const Text('ABOUT ME')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {}, child: const Text('CONTACT')),
                ),
                if (screenWidth(context) > 400)
                  SizedBox(
                    width: screenWidth(context) * 0.15,
                  ),
              ]
            : [],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => CupertinoScrollbar(
            child: ListView(
              shrinkWrap: true,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.pink.shade500, Colors.pink.shade400],
                        begin: Alignment.bottomRight),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context) * 0.15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Made for Sweet Dreams',
                            style: GoogleFonts.cookie(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context) * 0.15),
                        // height: 300,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio:
                                      constraints.maxWidth > 400 ? 1 : 1,
                                  crossAxisCount:
                                      constraints.maxWidth > 400 ? 4 : 2),
                          itemBuilder: (context, index) => const CakeCard(),
                        ),
                      ),
                    ],
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
        context.pushRoute(CakeDetails(name0: 'name0'));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            elevation = 10;
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'cake',
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoZU6Iqqqcsoo0J7Zpw-kjL6UtVKpNJKpTiA&usqp=CAU',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Black Forest',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.brown.shade600,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Rs. 250',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
