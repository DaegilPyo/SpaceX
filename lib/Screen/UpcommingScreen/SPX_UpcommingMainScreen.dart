import 'package:SpaceX/Models/Launch.dart';
import 'package:SpaceX/Screen/UpcommingScreen/SPX_UpcomingLaunchBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcommingMainScreen extends StatelessWidget {
  final List<LaunchRocket> upcommingLaunceRocketList;

  const UpcommingMainScreen({Key key, @required this.upcommingLaunceRocketList})
      : super(key: key);

  //Variable ——————————————————————————————————

  //—————————————————————————————————— Variable

//Functions——————————————————————————————————
  buildBody() {
    return Container(
      child: ListView(
        children: upcommingLaunceRocketList
            .map(
              (ulr) => UpcommingLaunchBox(
                launchRocket: ulr,
              ),
            )
            .toList(),
      ),
    );
  }

//——————————————————————————————————Functions

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }
}
