// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Row, Column;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: HomeRoute(),
  ));
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Air Force App"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(children: <Widget>[
          ListTile(
            leading: Icon(Icons.calendar_month, size: 50),
            title: Text('Upcoming Events'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpcomingEvents(),
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
            title: Text('Documents'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentsPage(),
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
                  builder: (context) => _MyHomePageState(
                  ),
                ),
              );
            },
          ),
        ]),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: SizedBox(
            height: 60.0,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeRoute()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpcomingEvents'),
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
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HelpfulLinks extends StatelessWidget {
  const HelpfulLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helpful Links'),
        backgroundColor: Colors.blue,
      ),
      body: Center(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SizedBox(
          height: 60.0,
        ),
      ),
    );
  }
}

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocumentsPage'),
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
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneDirectory extends StatelessWidget {
  const PhoneDirectory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneDirectory'),
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
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            // ignore: sort_child_properties_last
            ElevatedButton(child: Text('Create Excel'), onPressed: createExcel),
      ),
    );
  }

  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('FIRST');
    sheet.getRangeByName('A2').setText('Jonathon');
    sheet.getRangeByName('A3').setText('Jacob');
    sheet.getRangeByName('A4').setText('Third');
    sheet.getRangeByName('A5').setText('Fourth');
    sheet.getRangeByName('A6').setText('Fifth');
    sheet.getRangeByName('A7').setText('Sixth');
    sheet.getRangeByName('A8').setText('Seventh');
    sheet.getRangeByName('A9').setText('Eight');
    sheet.getRangeByName('B1').setText('LAST');
    sheet.getRangeByName('B2').setText('Denouden');
    sheet.getRangeByName('B3').setText('Brand');
    sheet.getRangeByName('B4').setText('Person');
    sheet.getRangeByName('B5').setText('Person');
    sheet.getRangeByName('B6').setText('Person');
    sheet.getRangeByName('B7').setText('Person');
    sheet.getRangeByName('B8').setText('Person');
    sheet.getRangeByName('B9').setText('Person');
    sheet.getRangeByName('C1').setText('ROLE');
    sheet.getRangeByName('C2').setText('VP');
    sheet.getRangeByName('C3').setText('VP');
    sheet.getRangeByName('C4').setText('CDO');
    sheet.getRangeByName('C5').setText('CFO');
    sheet.getRangeByName('C6').setText('IT');
    sheet.getRangeByName('C7').setText('EXEC');
    sheet.getRangeByName('C8').setText('DISTRO');
    sheet.getRangeByName('C9').setText('PROD');
    sheet.getRangeByName('D1').setText('Phone Number');
    sheet.getRangeByName('D2').setText('(316)XXX-XXX');
    sheet.getRangeByName('D3').setText('(316)XXX-XXX');
    sheet.getRangeByName('D4').setText('(316)XXX-XXX');
    sheet.getRangeByName('D5').setText('(316)XXX-XXX');
    sheet.getRangeByName('D6').setText('(316)XXX-XXX');
    sheet.getRangeByName('D7').setText('(316)XXX-XXX');
    sheet.getRangeByName('D8').setText('(316)XXX-XXX');
    sheet.getRangeByName('D9').setText('(316)XXX-XXX');


    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
          Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }
}