import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timetable_app/components/properties.dart';

import '../components/switchbutton.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.2,
          title: Text(
            "DashBoard",
            style: heading1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                },
                child: Icon(
                  Icons.exit_to_app_rounded,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        body: SwitchButton());
  }
}
