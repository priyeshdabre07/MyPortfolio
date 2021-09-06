import 'package:cakes_for_you/utility/global_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CakeDetailsPage extends StatelessWidget {
  final String name;

  const CakeDetailsPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Cake Details'),
      // ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink.shade500, Colors.pink.shade400],
                  begin: Alignment.bottomRight),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (screenWidth(context) > 400)
                  SizedBox(
                    width: screenWidth(context) * 0.15,
                  ),
                Hero(
                  tag: 'cake',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoZU6Iqqqcsoo0J7Zpw-kjL6UtVKpNJKpTiA&usqp=CAU',
                      fit: BoxFit.fitWidth,
                      width: 220,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Black Forest',
                  style: GoogleFonts.cookieTextTheme()
                      .headline1!
                      .copyWith(color: Colors.white, fontSize: 42),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
