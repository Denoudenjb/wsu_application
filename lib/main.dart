// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, prefer_const_literals_to_create_immutables, sort_child_properties_last, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Row, Column;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
                  builder: (context) => RequestInfo(),
                ),
              );
            },
          ),
        ]),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: SizedBox(
            height: 60.0,
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
        body: SfCalendar(
          view: CalendarView.timelineMonth,
          firstDayOfWeek: 6,
          dataSource: MeetingDataSource(_getDataSource()),
          // by default the month appointment display mode set as Indicator, we can
          // change the display mode as appointment using the appointment display
          // mode property
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    meetings.add(Meeting('training', startTime, endTime,
        Color.fromARGB(255, 82, 41, 148), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
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

 body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:8, vertical:16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Link',
                ),
              ),
            ),
          ],     
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
        ),
      ),
    );
  }
}

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
        child:
            // ignore: sort_child_properties_last
            ElevatedButton(
                child: Text('Export Excel to Phone'), onPressed: createExcel),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SizedBox(
          height: 60.0,
        ),
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