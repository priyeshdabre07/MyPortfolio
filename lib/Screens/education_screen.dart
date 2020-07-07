import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  final String name;

  const EducationScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Education'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Hi $name, Welcome',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
