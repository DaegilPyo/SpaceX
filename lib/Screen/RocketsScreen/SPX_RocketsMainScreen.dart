import 'package:SpaceX/Models/Rocket.dart';
import 'package:SpaceX/Screen/RocketsScreen/SPX_RocketBox.dart';
import 'package:flutter/material.dart';

class RocketsMainScreen extends StatelessWidget {
  final List<Rocket> rockets;
  const RocketsMainScreen({Key key, @required this.rockets}) : super(key: key);

  //Variable ——————————————————————————————————

  //—————————————————————————————————— Variable

//Functions——————————————————————————————————
  buildBody() {
    return ListView(
        children: rockets
            .map(
              (r) => RocketBox(
                rocket: r,
              ),
            )
            .toList());
  }

//——————————————————————————————————Functions

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }
}
