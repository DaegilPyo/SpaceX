import 'package:SpaceX/Models/Launch.dart';
import 'package:SpaceX/Screen/LaunchesScreen/SPX_LauchBox.dart';
import 'package:flutter/material.dart';

class LaunchMainScreen extends StatelessWidget {
  final List<LaunchRocket> launceRocketList;
  const LaunchMainScreen({
    Key key,
    @required this.launceRocketList,
  }) : super(key: key);

  //Variable ——————————————————————————————————

  //—————————————————————————————————— Variable

//Functions——————————————————————————————————
  buildBody() {
    return Container(
      child: ListView(
        children: launceRocketList
            .map((lr) => LaunchBox(
                  launchRocket: lr,
                ))
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
