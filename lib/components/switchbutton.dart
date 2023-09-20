import 'package:flutter/material.dart';
import 'package:timetable_app/components/properties.dart';

import 'package:timetable_app/components/studylist.dart';
import 'package:timetable_app/components/worklist.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              height: MediaQuery.sizeOf(context).height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade500,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isStudy = true;
                        });
                      },
                      child: Center(
                          child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              height: MediaQuery.sizeOf(context).height,
                              decoration: BoxDecoration(
                                  borderRadius: radius,
                                  color: isStudy
                                      ? Colors.black
                                      : Colors.transparent),
                              child: Center(
                                child: Text("Study",
                                    style: TextStyle(
                                        color: isStudy
                                            ? Colors.white
                                            : Colors.grey.shade700,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ))),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isStudy = false;
                          });
                        },
                        child: Center(
                            child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: MediaQuery.sizeOf(context).height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isStudy
                                        ? Colors.transparent
                                        : Colors.black),
                                child: Center(
                                  child: Text("Work",
                                      style: TextStyle(
                                          color: isStudy
                                              ? Colors.grey.shade700
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ))))
                  ])),
        ),
        isStudy ? StudyList() : WorkList(),
      ],
    );
  }
}
