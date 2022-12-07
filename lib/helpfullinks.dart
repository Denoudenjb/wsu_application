// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class HelpfulLinks extends StatelessWidget {
  const HelpfulLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helpful Links'),
        backgroundColor: Color.fromARGB(255, 7, 90, 158),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Link',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Desciption of Link',
            ),
          ),
          ElevatedButton(
            child: Text('Export Data'),
            onPressed: () {}, // Do something when pressed
          ),
        ],
      ),

      // ignore: prefer_const_constructors
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 7, 90, 158),
        child: SizedBox(
          height: 40.0,
        ),
      ),
    );
  }
}
