import 'package:flutter/material.dart';
import 'package:timetable_app/components/schedule.dart';

TextStyle heading1 = TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
Color backgroundColor = Colors.grey.shade800;
BorderRadius radius = BorderRadius.circular(20);
BorderRadius listRadius = BorderRadius.circular(12);
SizedBox gap10 = SizedBox(
  height: 10,
);
SizedBox gap20 = SizedBox(
  height: 20,
);
TextStyle description =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

TextStyle formText =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
bool isStudy = true;
TimeOfDay startTime = TimeOfDay(hour: 00, minute: 00);
TimeOfDay endTime = TimeOfDay(hour: 00, minute: 00);
var selectedDay = "Sunday";
bool dayChanged = false;

List<Schedule> studySchedule = [
  Schedule(
      type: ScheduleType.study,
      day: "Monday",
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 2))),
      description: "At Old Main with prof. Smith",
      title: "COMP 1130")
];
List<Schedule> workSchedule = [
  Schedule(
      type: ScheduleType.work,
      day: "Wednesday",
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 4))),
      description: "Shift at Tim Hortons",
      title: "Tim Hortons")
];
