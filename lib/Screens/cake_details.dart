import 'package:flutter/material.dart';

class CakeDetails extends StatelessWidget {
  final String name;

  const CakeDetails({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Cake Details'),
      // ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'cake',
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoZU6Iqqqcsoo0J7Zpw-kjL6UtVKpNJKpTiA&usqp=CAU',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([const Text('Text Goes Here')]))
      ]),
    );
  }
}
