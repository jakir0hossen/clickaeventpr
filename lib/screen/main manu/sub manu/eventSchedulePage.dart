import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventSchedulePage extends StatefulWidget {
  const EventSchedulePage({super.key});

  @override
  State<EventSchedulePage> createState() => _EventSchedulePageState();
}

class _EventSchedulePageState extends State<EventSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Event Schedule")),),
        body: SfCalendar(
          view: CalendarView.week,
          firstDayOfWeek: 6,
          dataSource: MeetingDataSource(getAppointment()),
        ),
    );
  }
}
List<Appointment> getAppointment(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime : startTime,
      endTime : endTime,
    subject: "Conference",
    color: Colors.red,
    recurrenceRule: "FREQ=DAILY;COUNT=2",
    isAllDay: true
  ));
  return meetings;
}






class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}