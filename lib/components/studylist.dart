import 'package:flutter/material.dart';
import 'package:timetable_app/components/properties.dart';

import '../pages/timetable.dart';

class StudyList extends StatelessWidget {
  const StudyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: studySchedule.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeTable(index)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: listRadius,
                      border: Border.all(color: Colors.transparent, width: 2),
                      color: Colors.grey.shade600,
                    ),
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gap10,
                        Text(
                          " ${studySchedule[index].title}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        gap10,
                        Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              studySchedule[index]
                                  .startTime
                                  .format(context)
                                  .toString(),
                              style: description,
                            ),
                            Text(
                              " - ",
                              style: description,
                            ),
                            Text(
                              studySchedule[index]
                                  .endTime
                                  .format(context)
                                  .toString(),
                              style: description,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              studySchedule[index].day,
                              style: description,
                            )
                          ],
                        ),
                        gap10,
                        Text(
                          "  ${studySchedule[index].description}",
                          style: description,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TimeTable()));
          },
          child: Center(
            child: Icon(
              Icons.add,
              size: 32,
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 2,
              fixedSize: Size(10, 100),
              backgroundColor: Colors.grey.shade600),
        )
      ],
    );
  }
}
