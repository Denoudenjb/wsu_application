// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RequestInfo extends StatelessWidget {
  const RequestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RequestInfo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SizedBox(
          height: 60.0,
        ),
      ),
    );
  }
}