import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_app/constants.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Portfolio',
          style: GoogleFonts.gupter(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(educationScreenRoute,
            arguments: _textEditingController.value.text),
        child: Icon(Icons.chevron_right),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    width: 300,
                    child: Text(
                      'Hi, It\'s Priyesh',
                      style: GoogleFonts.gupter(fontSize: 22),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    width: 300,
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(labelText: 'And you are?'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
