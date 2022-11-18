// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';



class Pictureviewer extends StatelessWidget {
  const Pictureviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pictureviewer'),
        backgroundColor: Colors.blue,
      ),

// ignore: prefer_const_constructors
body: Center(
  child: Image(
    image: AssetImage('images/plane.jpg'),
),),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SizedBox(
          height: 60.0,
        ),
      ),
    );
  }
}