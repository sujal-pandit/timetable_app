import 'package:flutter/material.dart';
import 'package:timetable_app/components/properties.dart';
import 'package:timetable_app/pages/timetable.dart';

class WorkList extends StatelessWidget {
  const WorkList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: workSchedule.length,
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
                          " ${workSchedule[index].title}",
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
                            Text(
                              workSchedule[index]
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
                              workSchedule[index]
                                  .endTime
                                  .format(context)
                                  .toString(),
                              style: description,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              workSchedule[index].day,
                              style: description,
                            )
                          ],
                        ),
                        gap10,
                        Text(
                          "  ${workSchedule[index].description}",
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
