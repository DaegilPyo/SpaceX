import 'package:SpaceX/Models/Launch.dart';
import 'package:SpaceX/Resources/Functions.dart';
import 'package:SpaceX/Resources/Widgets.dart';
import 'package:SpaceX/Screen/LaunchesScreen/SPX_LauchBox.dart';
import 'package:flutter/material.dart';

class UpcommingLaunchBox extends StatelessWidget {
  final LaunchRocket launchRocket;
  const UpcommingLaunchBox({
    Key key,
    @required this.launchRocket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String coutDown = getCountDown(launchRocket.launchDate);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LaunchBox(
            launchRocket: launchRocket,
          ),
          DetailedInformationFormat(
              textColor: Colors.black,
              title: 'launch date',
              desc: getDetailedDateFormat(dateTime: launchRocket.launchDate)),
          DetailedInformationFormat(
            textColor: Colors.black,
            title: 'launch site',
            desc: launchRocket.launchSite.siteFullname,
          ),
          DetailedInformationFormat(
            textColor: Colors.black,
            title: 'count down',
            desc: coutDown,
          ),
        ],
      ),
    );
  }
}
