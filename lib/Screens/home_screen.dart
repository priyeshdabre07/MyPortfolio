import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_app/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IntrinsicHeight(
          child: Row(
            children: [
              Container( padding: EdgeInsets.all(5),decoration: BoxDecoration(
                border: Border.all(

                )
              ),
                child: RichText(
                  text: TextSpan(text: 'P' , style: GoogleFonts.robotoCondensed( fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ), children: [TextSpan(text: 'D',style:GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold,
                      color: Colors.black
                  ) ) ]),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
