// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, prefer_const_literals_to_create_immutables, sort_child_properties_last, duplicate_ignore
import 'package:flutter/material.dart';
import 'pictureviewer.dart';
import 'calendar.dart';
import 'phonedirectory.dart';
import 'helpfullinks.dart';
import 'requestinfo.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("WSU_Project"),
          backgroundColor: Colors.blue,
        ),
        body: 
        ListView(children:  <Widget>[
          ListTile(
            leading: Icon(Icons.calendar_month, size: 50),
            title: Text('Upcoming Events'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Calendarevents(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline_sharp, size: 50),
            title: Text('Helpful Links'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpfulLinks(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.folder_copy, size: 50),
            title: Text('Pictures'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Pictureviewer(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone_outlined, size: 50),
            title: Text('Phone Directory'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhoneDirectory(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info, size: 50),
            title: Text('Request Info'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestInfo(),
                ),
              );
            },
          ),
        ]),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: SizedBox(
            height: 40.0,
          ),
        ),
      ),
    );
  }
}
