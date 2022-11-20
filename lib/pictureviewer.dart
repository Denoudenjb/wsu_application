import 'package:flutter/material.dart';

class Pictureviewer extends StatelessWidget {
  Pictureviewer({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('PhoneDirectory'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          height:150,
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            buildCard(),
            SizedBox(width: 12),
            buildCard(),
            SizedBox(width: 12),
            buildCard(),
            SizedBox(width: 12),
            buildCard(),
          ],
        ),
      ));

  Widget buildCard() => Container(width: 200, height: 200, color: Colors.red);
}
