import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:timetable_app/components/schedule.dart';
import 'package:timetable_app/pages/dashboard.dart';

import '../components/properties.dart';

// ignore: must_be_immutable
class TimeTable extends StatefulWidget {
  int index = -1;

  TimeTable([this.index = -1]);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   titleController.dispose();
  //   descriptionController.dispose();
  //   super.dispose();
  // }

  List<String> items = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  var hello;
  var titleController, descriptionController;

  @override
  void initState() {
    titleController = TextEditingController(
        text: widget.index == -1
            ? ""
            : (isStudy == true
                ? " ${studySchedule[widget.index].title}"
                : " ${workSchedule[widget.index].title}"));
    descriptionController = TextEditingController(
        text: widget.index == -1
            ? ""
            : (isStudy == true
                ? " ${studySchedule[widget.index].description}"
                : " ${workSchedule[widget.index].description}"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.2,
        title: Text(
          "TimeTable",
          style: heading1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            "Delete Confirmation",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            "Are you sure you want to delete this schedule?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (widget.index != -1 && isStudy == false) {
                                  workSchedule.removeAt(widget.index);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashBoard()));
                                } else if (widget.index != -1 &&
                                    isStudy == true) {
                                  studySchedule.removeAt(widget.index);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashBoard()));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashBoard()));
                                }
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade600),
                              ),
                            ),
                          ],
                        ));
              },
              child: Icon(
                Icons.delete_forever,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade800,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextFormField(
              controller: titleController,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white, width: 10)),
                label: Text(
                  "Title",
                  style: formText,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade500, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                prefixIcon: Icon(
                  Icons.text_fields_sharp,
                  color: Colors.white,
                ),
              )),
          gap20,
          SizedBox(
            height: 200,
            child: TextFormField(
                controller: descriptionController,
                maxLines: 200 ~/ 20,
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 10)),
                    label: Text(
                      "Description",
                      style: formText,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    prefixIcon: Icon(
                      Icons.note_add_sharp,
                      color: Colors.white,
                    ))),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Select The Day",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12)),
            child: DropdownButton2(
              value: widget.index == -1 || dayChanged == true
                  ? selectedDay
                  : (isStudy == true
                      ? studySchedule[widget.index].day
                      : workSchedule[widget.index].day),
              alignment: Alignment(0, 0),
              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (day) {
                setState(() {
                  selectedDay = day!;
                  dayChanged = true;
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Select The Time",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )),
          gap10,
          InkWell(
              child: ElevatedButton(
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Start Time  -  " + startTime.format(context).toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onPressed: () {
              _showTimePicker();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                fixedSize: Size(MediaQuery.sizeOf(context).width, 50)),
          )),
          SizedBox(
            height: 15,
          ),
          InkWell(
              child: ElevatedButton(
            child: Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "End Time  - " + endTime.format(context).toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onPressed: () {
              _showTimePicker2();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                fixedSize: Size(MediaQuery.sizeOf(context).width, 50)),
          )),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                if (isStudy == true) {
                  if (widget.index != -1) {
                    studySchedule.removeAt(widget.index);
                  }
                  studySchedule.add(Schedule(
                    type: ScheduleType.study,
                    day: selectedDay,
                    startTime: startTime,
                    endTime: endTime,
                    title: titleController.text,
                    description: descriptionController.text,
                  ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
                } else if (isStudy == false) {
                  if (widget.index != -1) {
                    workSchedule.removeAt(widget.index);
                  }
                  workSchedule.add(Schedule(
                    type: ScheduleType.work,
                    day: selectedDay,
                    startTime: startTime,
                    endTime: endTime,
                    title: titleController.text,
                    description: descriptionController.text,
                  ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
                }
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)))
        ]),
      ),
    );
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        startTime = value!;
      });
    });
  }

  void _showTimePicker2() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        endTime = value!;
      });
    });
  }
}
